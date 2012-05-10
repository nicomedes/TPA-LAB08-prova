<%-- 
    Document   : pag2
    Created on : 09/05/2012, 20:27:36
    Author     : 30980364
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <%             
        HttpSession sessao = request.getSession();          
//Coletando dados do request
        String tel = request.getParameter("tel");
        String prod = request.getParameter("produto"); 
        ArrayList<String> lista = (ArrayList)sessao.getAttribute("lista");
        
/* Esqueci de validar os dados do request para saber se o usuário
 * vinha da primeira página (tel != null) ou da página de inserção
 * de itens na lista de compras (prod != null). Caso o acesso venha da página
 * de inserção, atribuo a variavel "tel" o valor já disponível na sessão */        
        if (tel != null) {                       
             lista = new ArrayList();
        }
        
        if (prod != null){  
            lista.add(prod);
            tel = (String) sessao.getAttribute("tel");
        %>
        Telefone:<br> <%=tel%> <br>
        Compras:<br>
        <ul>
        <%    
 /*
 *           **Montagem da Lista**
 *  Usei "for avançado" ao invés de Iterator para exibir
 * a lista de compras da sessão pois o código fica mais conciso
 * e dispensa o cast para String dos itens inseridos na página de inserção
 * de itens */         
        for(String pro:lista){
            out.print("<li>"+ pro + "<br>");             
        }
   }
        
/*
 *Esqueci de gravar a lista e o telefone na sessão para que a lista e o 
 *telefone fiquem disponíveis*/        
        sessao.setAttribute("lista",lista);
        sessao.setAttribute("tel", tel);
        %>
        </ul>
       
                
              
        <a href="pag3.jsp">Comprar</a>
    </body>
</html>
