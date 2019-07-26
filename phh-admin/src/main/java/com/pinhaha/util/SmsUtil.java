package com.pinhaha.util;

import java.util.Random;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

/***
 * 
 * Description:
 * This class {tuiyiConsumer}  code is all, prohibit other projects that are not the company's project.
 * @author shiquanli
 *    <p>15257129351@163.com</p>
 *    <p>1695446827@qq.com</p>
 *    TITLE ：tuiyiConsumer - SmsDemo
 *    DATE ： 2018年10月19日 上午11:08:57
 */
public class SmsUtil {

    static final String product = "Dysmsapi";
    static final String domain = "dysmsapi.aliyuncs.com";
    static final String accessKeyId = "LTAIGuVOXeuSwIhF";
    static final String accessKeySecret = "jcMAmJtWTlFvtHdMxuH0dRQTwDVQex";

    public static SendSmsResponse sendSms(String phone,String code) throws Exception {

//        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
//        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);
        SendSmsRequest request = new SendSmsRequest();
        request.setPhoneNumbers(phone);
        request.setSignName("推易科技");
        request.setTemplateCode("SMS_151991791");
        request.setTemplateParam("{\"code\":\""+code+"\"}");
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        return sendSmsResponse;
    }
    
    
    public static SendSmsResponse sendTixianSms(String phone,String code) throws Exception {

//        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
//        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);
        SendSmsRequest request = new SendSmsRequest();
        request.setPhoneNumbers(phone);
        request.setSignName("推易科技");
        request.setTemplateCode("SMS_151996819");
        request.setTemplateParam("{\"code\":\""+code+"\"}");
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        return sendSmsResponse;
    }
    
	public synchronized static String getRandNum(int charCount) {
	        String charValue = "";
	        for (int i = 0; i < charCount; i++) {
	            char c = (char) (randomInt(0, 10) + '0');
	            charValue += String.valueOf(c);
	        }
	        return charValue;
	    }
	 public synchronized static int randomInt(int from, int to) {
	        Random r = new Random();
	        return from + r.nextInt(to - from);
	    }

	  public static void main(String[] args) {
		   try {
			  System.out.println( sendTixianSms("13320108779", "1688").getCode());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}


    
}