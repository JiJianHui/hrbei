package com.hrbei.common;

/**
 * Created with IntelliJ IDEA.
 * User: Ji JianHui
 * Time: 2014-07-23 11:06
 * Email: jhji@ir.hit.edu.cn
 */
public class Constants
{
    public static final String RESULT_NAME_TILES = "tiles";
    public static final String RESULT_NAME_REDIRECT_ACTION = "redirectAction";

    public static final Integer Page_Size = 5;
    public static final Integer Page_Size_Index = 15;

    public static final int BUFFER_SIZE = 4 * 1024 * 1024;

    public static final String Upload_File_Tmp_Path = "/upload/file/tmp";
    public static final String Upload_User_Path = "/upload/user";
    public static final String Upload_Company_Path = "/upload/company";
    public static final String Image_Dir = "/images";
    public static final String Image_Websit_Dir = "/images/RandomAdPic";

    /*******************产品类别*********************/
    public static final String Category_Product = "product";
    public static final String Category_News  = "news";

    public static final Integer Category_News_BegId = 13;
    public static final Integer Category_News_Hire = 14;

    /**************公司商家相关********************/

    public static final Integer Company_Status_Review   = 0;   //公司处于审核状态，不能对外
    public static final Integer Company_Status_Open     = 1;   //公司处于运营状态
    public static final Integer Company_Status_Suspend  = 2;   //公司处于暂停状态
    public static final Integer Company_Status_Close    = 3;   //公司处于关门整修状态

    public static final Integer News_Company = 0;
    public static final Integer News_User    = 1;

    public static final Integer NewsDefault  = 0; //默认新闻
    public static final Integer NewsHire     = 1; //招聘新闻
    public static final Integer NewsFindJob  = 2;  //找工作新闻

    public static final String Company_Default_Portrait = "images/company/defaultCompanyLogo.jpg";
    public static final String Company_Default_Image = "images/company/company_head2.jpg";

    /* ----------------------Session variable-----------------------------*/
    public static final String SESSION_USER_ID = "userID";
    public static final String SESSION_USER_NANE = "nickName";
    public static final String SESSION_USER_EMAIL = "email";
    public static final String SESSION_USER_LOGO_URL = "userLogoUrl";
    public static final String SESSION_USER_ROLE_TYPE = "roleType";

    /**************用户相关：头像、权限等********************/
    public static final Integer User_RoleType_Normal = 0;
    public static final Integer User_RoleType_Company = 1;
    public static final Integer User_RoleType_Maintain = 2;
    public static final Integer User_RoleType_Admin = 3;
    public static final String User_Default_Portrait = "images/user/defaultPortrait.png";

}
