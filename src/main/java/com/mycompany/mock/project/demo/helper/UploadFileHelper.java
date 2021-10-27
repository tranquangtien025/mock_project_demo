/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mock.project.demo.helper;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author TIEN
 */
public class UploadFileHelper {

    public static File simpleUpload(MultipartFile file,
            HttpServletRequest request, boolean encrypt_file_name) {
        String filename = null;
        File serverFile = null;
        try {
            if (!file.isEmpty()) {

                if (encrypt_file_name) {
                    String currentFileName = file.getOriginalFilename();
                    String extension = currentFileName.substring(
                            currentFileName.lastIndexOf("."),
                            currentFileName.length());
                    Long nameRandom = Calendar.getInstance().getTimeInMillis();
                    String newFilename = nameRandom + extension;
                    filename = newFilename;
                } else {
                    filename = file.getOriginalFilename();
                }
                byte[] bytes = file.getBytes();
                String applicationPath = request.getServletContext().getRealPath("/upload");
                int index = applicationPath.indexOf("target");
                String pathFolder = applicationPath.substring(0, index) + "\\src\\main\\webapp\\resources\\upload";
                File dir = new File(pathFolder);

                if (!dir.exists()) {
                    dir.mkdirs();
                }
                serverFile = new File(dir.getAbsolutePath()
                        + File.separator + filename);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return serverFile;
            } else {
                serverFile = null;
            }
        } catch (Exception e) {
            serverFile = null;
        }
        return serverFile;
    }

    public static List<String> multipartFileUpload(List<MultipartFile> files,
            HttpServletRequest request, boolean encrypt_file_name) {
        List<String> filenames = new ArrayList<>();
        try {
            if (files.size() != 0) {
                BufferedOutputStream stream = null;
                for (MultipartFile file : files) {
                    String filename = "";
                    if (encrypt_file_name) {
                        String currentFileName = file.getOriginalFilename();
                        String extension = currentFileName.substring(
                                currentFileName.lastIndexOf("."),
                                currentFileName.length());
                        Long nameRandom = Calendar.getInstance().getTimeInMillis();
                        String newFilename = nameRandom + extension;
                        filename = newFilename;
                    } else {
                        filename = file.getOriginalFilename();
                    }
                    byte[] bytes = file.getBytes();
                    String applicationPath = request.getServletContext().getRealPath("/upload");
                    int index = applicationPath.indexOf("target");
                    String pathFolder = applicationPath.substring(0, index) + "\\src\\main\\webapp\\resources\\upload";
                    File dir = new File(pathFolder);
                    
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }
                    File serverFile = new File(dir.getAbsolutePath()
                            + File.separator + filename);
                    stream = new BufferedOutputStream(
                            new FileOutputStream(serverFile));
                    stream.write(bytes);
                    System.out.println(filename);
                    filenames.add(filename);
                }
                stream.close();
            } else {
                filenames = null;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            filenames = null;
        }
        return filenames;
    }
}
