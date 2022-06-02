package com.saitej.util;

import com.mysql.cj.util.StringUtils;
import com.saitej.dao.UserDao;
import com.saitej.model.User;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class DownloadUtil {
    private static Logger LOGGER = Logger.getLogger(DownloadUtil.class);
    public static HSSFWorkbook generateDownloadTasksExcel(HttpServletRequest request) {
        LOGGER.info("in generateDownloadTasksExcel method ");

        //create workbook (workbook is a group of worksheets)
        HSSFWorkbook workbook = new HSSFWorkbook();

        //create worksheet
        HSSFSheet worksheet = workbook.createSheet("Users");

        //set column width of worksheet columns
        worksheet.setColumnWidth(0, 3000);
        worksheet.setColumnWidth(1, 3000);
        worksheet.setColumnWidth(2, 5000);
        worksheet.setColumnWidth(3, 5000);
        worksheet.setColumnWidth(4, 3000);
        worksheet.setColumnWidth(5, 6000);
        worksheet.setColumnWidth(6, 6000);


        //set font and color for column names
        HSSFFont font = workbook.createFont();
        font.setColor(HSSFColor.HSSFColorPredefined.BLACK.getIndex());
        font.setFontHeightInPoints((short) 12);
        font.setBold(true);
        font.setFontName("Calibri");
        font.setItalic(true);

        //style row header for columns
        HSSFCellStyle rowHeaderCellStyle = workbook.createCellStyle();
        rowHeaderCellStyle.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
        rowHeaderCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        rowHeaderCellStyle.setAlignment(HorizontalAlignment.CENTER);
        rowHeaderCellStyle.setBorderBottom(BorderStyle.THIN);
        rowHeaderCellStyle.setBorderTop(BorderStyle.THIN);
        rowHeaderCellStyle.setBorderLeft(BorderStyle.THIN);
        rowHeaderCellStyle.setFont(font);


        //create  row 0
        HSSFRow row = worksheet.createRow(0);
        row.setHeightInPoints(16);

        // add column names with styles for row 0  (R0Cell0 --> 0th row 0th cell)

        for (int i = 0; i <=6 ; i++) {
            HSSFCell R0Cell0 = row.createCell((short) i);
            R0Cell0.setCellStyle(rowHeaderCellStyle);
        }

      /*  HSSFCell R0Cell0 = row.createCell((short) 0);
        R0Cell0.setCellStyle(rowHeaderCellStyle);
        HSSFCell R0Cell1 = row.createCell((short) 1);
        R0Cell1.setCellStyle(rowHeaderCellStyle);
        HSSFCell R0Cell2 = row.createCell((short) 2);
        R0Cell2.setCellStyle(rowHeaderCellStyle);*/
        HSSFCell R0Cell3 = row.createCell((short) 3);
        R0Cell3.setCellStyle(rowHeaderCellStyle);
        R0Cell3.setCellValue("USERS LIST");
      /*  HSSFCell R0Cell4 = row.createCell((short) 4);
        R0Cell4.setCellStyle(rowHeaderCellStyle);
        HSSFCell R0Cell5 = row.createCell((short) 5);
        R0Cell5.setCellStyle(rowHeaderCellStyle);
        HSSFCell R0Cell6 = row.createCell((short) 6);
        R0Cell6.setCellStyle(rowHeaderCellStyle);*/


        //create  row 1
        HSSFRow row_1 = worksheet.createRow(1);
        row_1.setHeightInPoints(14);

        // add column names with styles for row 1
        HSSFCell R1cell0 = row_1.createCell((short) 0);
        R1cell0.setCellStyle(rowHeaderCellStyle);
        R1cell0.setCellValue("User Id");

        HSSFCell R1cell1 = row_1.createCell((short) 1);
        R1cell1.setCellStyle(rowHeaderCellStyle);
        R1cell1.setCellValue(" Name");

        HSSFCell R1cell2 = row_1.createCell((short) 2);
        R1cell2.setCellStyle(rowHeaderCellStyle);
        R1cell2.setCellValue("Email");

        HSSFCell R1cell3 = row_1.createCell((short) 3);
        R1cell3.setCellStyle(rowHeaderCellStyle);
        R1cell3.setCellValue("Role");

        HSSFCell R1cell4 = row_1.createCell((short) 4);
        R1cell4.setCellStyle(rowHeaderCellStyle);
        R1cell4.setCellValue("Status");

        HSSFCell R1cell5 = row_1.createCell((short) 5);
        R1cell5.setCellStyle(rowHeaderCellStyle);
        R1cell5.setCellValue("Created_date");

        HSSFCell R1cell6 = row_1.createCell((short) 6);
        R1cell6.setCellStyle(rowHeaderCellStyle);
        R1cell6.setCellValue("Updated_date");

        populateWorkBookData(worksheet, 2, request);

        return workbook;


    }

    private static void populateWorkBookData(HSSFSheet worksheet, int dataRowIndex, HttpServletRequest request) {
       LOGGER.info("in populateWorkBookData method ");
        UserDao userDao = new UserDao();
        List<User> users = userDao.selectAllUsers();
        System.out.println("users = " + users);

        if (users != null) {
            for (User user : users) {
                HSSFRow row1 = worksheet.createRow(dataRowIndex);
                row1.setHeightInPoints(14);

                HSSFCell R1cell0 = row1.createCell((short) 0);
                R1cell0.setCellValue(user.getId());

                HSSFCell R1cell1 = row1.createCell((short) 1);
                R1cell1.setCellValue(user.getName());

                HSSFCell R1cell2 = row1.createCell((short) 2);
                R1cell2.setCellValue(user.getEmail());

                HSSFCell R1cell3 = row1.createCell((short) 3);
                R1cell3.setCellValue(user.getRole());

                HSSFCell R1cell4 = row1.createCell((short) 4);
                R1cell4.setCellValue(user.getStatus());

                if (!StringUtils.isNullOrEmpty(user.getCreated_date())) {
                    HSSFCell R1cell5 = row1.createCell((short) 5);
                    R1cell5.setCellValue(user.getCreated_date());
                }

                if (!StringUtils.isNullOrEmpty(user.getUpdated_date())) {
                    HSSFCell R1cell6 = row1.createCell((short) 6);
                    R1cell6.setCellValue(user.getUpdated_date());
                }
                dataRowIndex++;
            }
        }

    }
}
