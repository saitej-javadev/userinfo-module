package com.saitej.util;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

public class UploadUtil {
    private static Logger LOGGER = Logger.getLogger(UploadUtil.class);
    public static void uploadFile(HttpServletRequest request) {
        LOGGER.info("in uploadFile method");
        String UPLOAD_DIRECTORY = "D:/uploads";
       boolean isMultipart;
       int maxFileSize=850000*1024;
       int maxMemSize = 4*1024;
       isMultipart = ServletFileUpload.isMultipartContent(request);

        if(isMultipart){
            try {
                DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
                fileItemFactory.setSizeThreshold(maxMemSize);
                fileItemFactory.setRepository(new File("C:\\temp"));
                ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
                servletFileUpload.setSizeMax(maxFileSize);

                List<FileItem> multiParts = servletFileUpload.parseRequest(request);

                for(FileItem item : multiParts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }

                LOGGER.debug("File Uploaded Successfully...");

                request.setAttribute("isUploadSuccess", true);
            } catch (Exception ex) {
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }

        }else{
            request.setAttribute("message",
                    "Sorry this Servlet only handles file upload request");
        }
    }

}
