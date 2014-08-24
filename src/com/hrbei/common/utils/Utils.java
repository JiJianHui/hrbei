package com.hrbei.common.utils;

import com.hrbei.common.Constants;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-08-10 22:14
 * Email: jhji@ir.hit.edu.cn
 */
public class Utils {

    protected static Logger logger = LogManager.getLogger(Utils.class.getName());

    public static String getEmptyString(String s) {
        return s == null ? "" : s;
    }

    public static Integer getEmptyInteger(Integer s) {
        return s == null ? 0 : s;
    }

    public static String getCountHQLString(String hql) {
        String regex = " (?i)from ";
        hql = " " + hql;
        String[] hqlPart = hql.split(regex);
        if (hqlPart.length > 1) {
            if (StringUtils.containsIgnoreCase(hqlPart[0], "select")) {
                hqlPart[0] = hqlPart[0].replaceFirst("(?i)select", "select count( ") + " ) ";
            } else {
                hqlPart[0] = "select count(*) " + hqlPart[0];
            }

        }
        return StringUtils.join(hqlPart, " from ");
    }

    public static void notReplaceFileFromTmpModified(String toDir, String fileName) {
        String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.Upload_File_Tmp_Path + "/" + fileName);
        String toPath = toDir + File.separatorChar + fileName;
        notReplaceFileAndCopy(srcPath, toPath);
    }

    public static void notReplaceFileAndCopy(String srcPath, String dstPath) {
        File src = new File(srcPath);
        File dst = new File(dstPath);

        if (!dst.getParentFile().exists()) {
            dst.getParentFile().mkdirs();
        }
        copyByChannel(src, dst);
    }

    public static void copyByChannel(File f1, File f2) {
        try {
            int length = Constants.BUFFER_SIZE;
            FileInputStream in = new FileInputStream(f1);
            FileOutputStream out = new FileOutputStream(f2);
            FileChannel inC = in.getChannel();
            FileChannel outC = out.getChannel();
            int i = 0;
            while (true) {
                if (inC.position() == inC.size()) {
                    inC.close();
                    outC.close();
                    return;
                }
                if ((inC.size() - inC.position()) < Constants.BUFFER_SIZE)
                    length = (int) (inC.size() - inC.position());
                else
                    length = Constants.BUFFER_SIZE;
                inC.transferTo(inC.position(), length, outC);
                inC.position(inC.position() + length);
                i++;
            }

        } catch (IOException e) {
            logger.error("copy file failed ", e);
        }
    }
}
