<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        p {
            font-size: 1.3rem;
        }
        ul {
            font-size: 1.3rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: auto auto; background-color: lightblue; text-align: center; width: 88%; padding: 35px;">
            <div style="display:flex; justify-content:space-between;">
                <h3 align="left"><asp:Label ID="lbl_pageVisits" runat="server"></asp:Label></h3>
                <h3><a href="login.aspx">LOGIN</a></h3>
            </div>
            <h1>What is State in ASP.NET</h1>
            <p>Hyper Text Transfer Protocol (HTTP) is a stateless protocol. When the client disconnects from the server, the ASP.NET engine discards the page objects.ASP.NET State management is a preserve state control and object in an application because ASP.NET web applications are stateless. A new instance of the Web page class is created each time the page is posted to the server. If a user enters information into a web application, that information would be lost in the round trip from the browser (MSDN).</p>
            <ul align="left">
                <li>Client-Based State Managment</li>
                <ol>
                    <li>Cookies</li>
                    <li>Hidden Fields</li>
                    <li>View State</li>
                    <li>Query String</li>
                    <br />
                </ol>
                <li>Server-Based State Managment</li>
                <ol>
                    <li>Session</li>
                    <li>Application</li>
                </ol>
            </ul>

            <h2>Application</h2>
            <p>Application State is a server side management state. It is also called application level state management. The ASP.NET application is the collection of all web pages, code and other files within a single virtual directory on a web server. When information is stored in application state, it is available to all the users. To provide for the use of application state, ASP.NET creates an application state object for each application from the HTTPApplicationState class and stores this object in server memory. This object is represented by class file global.asax.</p>
            <p style="font-size:1.1rem;"><b>Syntax : Application["key"] = Value;</b> OR Application.Add("key","value");</p>
            <p style="font-size:1.1rem;"><b>Example : Application["pageVisits"] = 111;</b> OR Application.Add("pageVisits",111);</p>
            <br /> <br /><br />
            <table style="font-size:1.2rem;" cellpadding="6" border="1">
                <thead>
                    <tr>
                        <th>Session State</th>
                        <th>Application State</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Sesions are is used to save the user specific data like UserID, User Role, etc. And can be accessible only by that user.</td>
                        <td>Application variable are used to save the application level data. And can be accessible by all the users.</td>
                    </tr>
                    <tr>
                        <td>Data stored in the SesionState will be cleared when the session expired(usually after 20min of inactivity).</td>
                        <td>Data stored in the Application variable will be cleared when the application restart.</td>
                    </tr>
                    <tr>
                        <td>Session state is user and browser specific.</td>
                        <td>Application state is application specific.</td>
                    </tr>
                    <tr>
                        <td>Session state can be stored in memory on the server as well as client’s cookies.</td>
                        <td>Application state is stored only in the memory on the server.</td>
                    </tr>
                    <tr>
                        <td>Session state has scope to the current browser only. </td>
                        <td>Application state has no scope to the current browser.</td>
                    </tr>
                </tbody>
            </table>
            <br /><br /><br />
            <h3 align="left">Most Used to store</h3>
            <ul align="left">
                <li>Hit Counter</li>
                <li>Count Page Visits</li>
                <li>Tax Rates</li>
                <li>Discount Rates etc.</li>
            </ul>
        </div>
    </form>
</body>
</html>
