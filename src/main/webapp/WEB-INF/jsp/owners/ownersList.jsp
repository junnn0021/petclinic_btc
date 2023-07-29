<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="customers">
    <h2 id="customers">customers</h2>

    <table id="customersTable" class="table table-striped" aria-describedby="customers">
        <thead>
        <tr>
            <th scope="col" style="width: 150px;">Name</th>
            <th scope="col" style="width: 200px;">Address</th>
            <th scope="col">City</th>
            <th scope="col" style="width: 120px">Telephone</th>
            <th scope="col">Pets</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${selections}" var="customer">
            <tr>
                <td>
                    <spring:url value="/customers/{customerId}" var="customerUrl">
                        <spring:param name="customerId" value="${customer.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(customerUrl)}"><c:out value="${customer.firstName} ${customer.lastName}"/></a>
                </td>
                <td>
                    <c:out value="${customer.address}"/>
                </td>
                <td>
                    <c:out value="${customer.city}"/>
                </td>
                <td>
                    <c:out value="${customer.telephone}"/>
                </td>
                <td>
                    <c:forEach var="pet" items="${customer.pets}">
                        <c:out value="${pet.name} "/>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>
