<%@ Page Title="Add Resource" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResourceAdd.aspx.cs" Inherits="IdentityTest.Modules.ResourceAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div ng-controller="addResourceController">
        <div class="row">
            <div class="col-md-3 inner-container">
                <p>
                    <strong>Resources</strong> are the core units of the modules. They consist of links to websites that contain
                    information that will be relevant to learning, like articles, tutorials, explanation videos, TED Talks, etc.
                    They can also link to events that transcend the web, such as conferences, meetups, spaces, labs, etc.
                </p>
            </div>
            <div class="col-md-9 main-container">
                <h2>Add Resource</h2>
                <ul class="no-bullets form-list">
                    <li>
                        <asp:Label runat="server" AssociatedControlID="ResourceTitle">Title</asp:Label><br />
                        <asp:TextBox runat="server" ID="ResourceTitle" Columns="60"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="ResourceTitle"
                            ErrorMessage="The title field is mandatory."
                            Display="Dynamic"
                            CssClass="error" />
                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="ResourceTitle" 
                            ValidationExpression="^[\s\S]{0,50}$"
                            ErrorMessage="The max length of the title is 50 characters."
                            CssClass="error"/>
                    </li>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="ResourceUrl">URL</asp:Label><br />
                        <asp:TextBox runat="server" ID="ResourceUrl" Columns="60"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="ResourceUrl"
                            ErrorMessage="The URL field is mandatory."
                            Display="Dynamic"
                            CssClass="error" />
                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="ResourceUrl" 
                            ValidationExpression="^[\s\S]{0,2000}$"
                            ErrorMessage="The max length of the URL is 2000 characters."
                            CssClass="error"/>
                    </li>
                    <li>
                        <asp:Label AssociatedControlID="ddlTypes" runat="server">Resource Type</asp:Label><br />
                        <asp:DropDownList runat="server" 
                            ID="ddlTypes"
                            DataTextField="Name"
                            DataValueField="Id">
                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="ddlTypes" 
                            ErrorMessage="Please select a type for the resource"
                            CssClass="error">
                        </asp:RequiredFieldValidator>
                    </li>
                    <li>
                        <asp:Label AssociatedControlID="rblDifficulty" runat="server">Difficulty</asp:Label><br />
                        <p>Rate the difficulty or applicability of this resource on a scale from 1 (Novice) to 5 (Expert)</p>

                        Novice
                        <asp:RadioButtonList runat="server" ID="rblDifficulty" CssClass="horizontal" RepeatLayout="OrderedList">
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        </asp:RadioButtonList>
                        Expert
                    </li>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="ResourceImageUrl">Image URL</asp:Label><br />
                        <asp:TextBox runat="server" ID="ResourceImageUrl" Columns="60"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="ResourceImageUrl"
                            ErrorMessage="The Image URL field is mandatory."
                            Display="Dynamic"
                            CssClass="error" />
                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="ResourceImageUrl" 
                            ValidationExpression="^[\s\S]{0,2000}$"
                            ErrorMessage="The max length of the URL is 2000 characters."
                            CssClass="error"/>
                        <%--
                        <asp:Label runat="server" AssociatedControlID="ResourceImage">Upload resource image:</asp:Label>
                        <asp:FileUpload ID="ResourceImage" runat="server" />
                        <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="ResourceImage"
                            ErrorMessage="The image upload is mandatory."
                            Display="Dynamic"
                            CssClass="error" />
                        --%>
                    </li>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="ResourceDescription">Description</asp:Label>
                        <p>
                            Make sure to include information on why is this resource here, such as: why is this resource useful? 
                            What users would benefit from this? What should users expect to learn? etc.
                        </p>
                        <asp:TextBox runat="server" ID="ResourceDescription" TextMode="MultiLine" Columns="60" Rows="10"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" 
                            ControlToValidate="ResourceDescription"
                            ErrorMessage="The description field is mandatory."
                            Display="Dynamic"
                            CssClass="error" />
                        <asp:RegularExpressionValidator runat="server"
                            ControlToValidate="ResourceDescription" 
                            ValidationExpression="^[\s\S]{0,2000}$"
                            ErrorMessage="The max length of the description is 2000 characters."
                            CssClass="error"/>
                    </li>
                    <li>
                        <label>Metadata</label>
                        <p>Use the form below to add any extra data relate to this resource. For example: if the resource is an event, click on the '+ Add Metadata' button, select 'Date and time' from 'Data type' dropdown menu, enter Date on the name textbox, and enter the desired data on the value textbox.</p>

                        <table class="table table-striped" ng-show="metadata.length > 0">
                            <thead>
                                <tr>
                                    <th>Data Type</th>
                                    <th>Name</th>
                                    <th>Value</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="md in metadata">
                                    <td>
                                        <select ng-model="md.dataType">
                                            <option value="-" selected>-</option>
                                            <option value="text">Text</option>
                                            <option value="date">Date</option>
                                            <option value="integer">Integer</option>
                                            <option value="real">Real number</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" placeholder="e.g. Date, Price, Author" ng-model="md.name" />
                                    </td>
                                    <td>
                                        <input type="text" placeholder="e.g. 20/12/2015, 39.99, Jules Verne" ng-model="md.value" />
                                    </td>
                                    <td>
                                        <a class="btn btn-danger" ng-click="removeMetadata($index)">x</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <%-- A hidden textbox is used instead of a hidden field to allow validation controls --%>
                        <a class="btn btn-default" ng-click="addMetadata()">+ Add metadata</a>

                        <asp:CustomValidator ID="uc_MetadataValidator" 
                            runat="server" 
                            ErrorMessage="Make sure that the metadata are valid"
                            ControlToValidate="uc_Metadata" 
                            OnServerValidate="uc_MetadataValidator_ServerValidate"
                            CssClass="error"></asp:CustomValidator>
                        
                        <asp:TextBox runat="server" 
                            ClientIDMode="Static" 
                            ID="uc_Metadata" 
                            ng-model="metadataJson"
                            Value="[]" 
                            Style="visibility: hidden;"></asp:TextBox> 
                    </li>
                    <li class="separator">
                        <asp:Button ID="CreateResource" runat="server" Text="Create Resource" OnClick="CreateResource_Click" CssClass="btn btn-default" />
                    </li>
                </ul>
            </div>
        </div>
        
    </div>
    
    <script type="text/javascript">
        var iwApp = angular.module('iw', []);

        var addResourceController = iwApp.controller('addResourceController', function($scope){
            var Metadata = function () {
                return {
                    dataType: 'Text',
                    name: '',
                    value: ''
                };
            };

            $scope.metadata = [];
            $scope.metadataJson = '';

            $scope.$watch('metadata', function () {
                $scope.metadataJson = angular.toJson($scope.metadata);
            }, true);

            $scope.addMetadata = function () {
                if ($scope.metadata.length < 10) {
                    $scope.metadata.push(new Metadata());
                } else {
                    alert('Maximum of 10 key/value pairs allowed')
                }
            };

            $scope.removeMetadata = function (index) {
                if (confirm("Are you sure you want to delete this metadata?")) {
                    $scope.metadata.splice(index, 1);
                }
            };

            var init = function () {
                // Checking if there are values already in the metadataJson (e.g. after validation error)
                // Yes, I'm mixing jQuery with angular. I need to get data that remains on the input value after 
                // a validation error. When page loads, angular doesn't know about it.
                // I'm currently looking for a better solution, but haven't found one so far.
                var json = $("#uc_Metadata").val();
                // Checking if string has the angular expression syntax. If so, it is the first page load.
                if (json.indexOf("{{") == -1) {
                    var metadata = JSON.parse(json);
                    for (var i = 0; i < metadata.length; i++) { 
                        $scope.metadata.push(metadata[i]);
                    }
                }
            }

            init();
        });
    </script>

</asp:Content>
