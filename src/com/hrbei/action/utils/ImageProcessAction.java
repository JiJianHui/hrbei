package com.hrbei.action.utils;

import com.hrbei.action.BasicAction;
import com.hrbei.common.Constants;
import com.hrbei.rep.company.dao.CompanyDao;
import com.hrbei.rep.company.entity.Company;
import com.hrbei.rep.user.dao.UserDao;
import com.hrbei.rep.user.entity.User;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.io.*;

/**
 * Created by GoGoWise
 * User: GGW
 * Date: 12-4-30
 * Time: 下午6:08
 * To change this template use File | Settings | File Templates.
 */
@SuppressWarnings("UnusedDeclaration")
@Controller
@Scope(BeanDefinition.SCOPE_PROTOTYPE)
@Namespace(BasicAction.BASE_NAME_SPACE)
public class ImageProcessAction extends BasicAction{
    private UserDao userDao;
    private User user;
    private int imgX;
    private int imgY;
    private int imgWidth;
    private int imgHeight;
    private String userPortraitName;

    private Company company;
    private CompanyDao companyDao;

    @Action(value = "cropUserPortrait")
    public void cropUserPortrait() throws IOException {
        if (StringUtils.isNotBlank(this.getUserPortraitName())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.Upload_File_Tmp_Path
                    + File.separator + this.getUserPortraitName());
            String toPath = ServletActionContext.getServletContext().getRealPath("")+
                    Constants.Upload_User_Path + File.separator + getSessionUserId() + "/userPortrait/" + this.getUserPortraitName();

            //获取拓展名
            String extName="";
            if (userPortraitName.lastIndexOf(".") >= 0) {
                extName = userPortraitName.substring(userPortraitName.lastIndexOf(".")+1);
            }

            BufferedImage tag = getBufferImage(srcPath);

            createFiles(toPath);

            ImageIO.write(tag,extName,new FileOutputStream(toPath));

            //持久化
            User _user = userDao.findById(getSessionUserId());
            _user.setLogo(Constants.Upload_User_Path + "/" + getSessionUserId() + "/userPortrait/" + this.getUserPortraitName());
            userDao.persistAbstract(_user);
            this.setUser(_user);
            this.setUserToSession(_user);

            PrintWriter out = ServletActionContext.getResponse().getWriter();
            out.print(Constants.Upload_User_Path + "/" + getSessionUserId() + "/userPortrait");
            out.close();
        }
    }


    @Action(value = "cropProductPortrait")
    public void cropProductPortrait() throws IOException {
        if (StringUtils.isNotBlank(this.getUserPortraitName())) {
            String srcPath = ServletActionContext.getServletContext().getRealPath(Constants.Upload_File_Tmp_Path
                    + File.separator + this.getUserPortraitName());

            //获取拓展名
            String extName="";
            if (userPortraitName.lastIndexOf(".") >= 0) {
                extName = userPortraitName.substring(userPortraitName.lastIndexOf(".")+1);
            }

            BufferedImage tag = getBufferImage(srcPath);
            createFiles(srcPath);
            ImageIO.write(tag,extName,new FileOutputStream(srcPath));
        }
    }

    @Action(value = "userPortraitCrop", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".userPortraitCrop")})
    public String userPortraitCrop(){
        return SUCCESS;
    }

    @Action(value = "productCrop", results = {@Result(name = SUCCESS,type = Constants.RESULT_NAME_TILES, location = ".productCrop")})
    public String productCrop(){
        company = companyDao.findById(this.getCompany().getId());
        return SUCCESS;
    }


    private void createFiles(String toPath){
        File toFile = new File(toPath);
        if(!toFile.getParentFile().exists()){
            toFile.getParentFile().mkdirs();
        }else{
//            File[] files = toFile.getParentFile().listFiles();
//            for(File file:files){
//                if(file.getName() == courseLogoName)
//                    file.delete();
//            }
        }
    }

    /**
     * 从指定路径中取出图片并对其裁剪
     * @param srcPath  指定图片的路径
     * @return  处理之后的BufferedImage对象
     */
    private BufferedImage getBufferImage(String srcPath) throws IOException{
        //对图片的处理
        BufferedImage bImg = ImageIO.read(new FileInputStream(srcPath));
        Image image = bImg.getScaledInstance(bImg.getWidth(),bImg.getHeight(),Image.SCALE_DEFAULT);

        CropImageFilter cif = new CropImageFilter(imgX,imgY,imgWidth,imgHeight);
        Image img = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(image.getSource(),cif));

        BufferedImage tag = new BufferedImage(imgWidth,imgHeight,BufferedImage.TYPE_INT_RGB);
        Graphics2D g = (Graphics2D)tag.getGraphics();
        g.drawImage(img, 0, 0, null);
        g.dispose();

        return tag;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getImgX() {
        return imgX;
    }

    public void setImgX(int imgX) {
        this.imgX = imgX;
    }

    public int getImgY() {
        return imgY;
    }

    public void setImgY(int imgY) {
        this.imgY = imgY;
    }

    public int getImgWidth() {
        return imgWidth;
    }

    public void setImgWidth(int imgWidth) {
        this.imgWidth = imgWidth;
    }

    public int getImgHeight() {
        return imgHeight;
    }

    public void setImgHeight(int imgHeight) {
        this.imgHeight = imgHeight;
    }

    public String getUserPortraitName() {
        return userPortraitName;
    }

    public void setUserPortraitName(String userPortraitName) {
        this.userPortraitName = userPortraitName;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public CompanyDao getCompanyDao() {
        return companyDao;
    }

    public void setCompanyDao(CompanyDao companyDao) {
        this.companyDao = companyDao;
    }
}
