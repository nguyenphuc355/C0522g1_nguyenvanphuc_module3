package controller;

import model.Facility;
import model.FacilityType;
import model.RentType;
import service.IFacilityService;
import service.IFacilityTypeService;
import service.IRentTypeService;
import service.impl.FacilityService;
import service.impl.FacilityTypeService;
import service.impl.RentTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/FacilityServlet")
public class FacilityServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();
    private IFacilityTypeService facilityTypeService = new FacilityTypeService();
    private IRentTypeService rentTypeService = new RentTypeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "update":
                break;
            case "delete":
                deleteFacility(request,response);
                break;
            default:
                showListFacility(request,response);

        }

    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = facilityService.deleteFacility(id);
        String mess = "successful delete";
        if (!check){
            mess = "delete failed";
        }
        request.setAttribute("mess",mess);
        showListFacility(request,response);
    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("facility/facilityList.jsp");
        List<Facility> facilityList = facilityService.findAll();
        List<FacilityType> facilityTypeList = facilityTypeService.findAll();
        List<RentType> rentTypeList = rentTypeService.findAll();
        request.setAttribute("facilityList",facilityList);
        request.setAttribute("facilityTypeList",facilityTypeList);
        request.setAttribute("rentTypeList",rentTypeList);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":

                break;
            case "update":
                break;

        }
    }
}
