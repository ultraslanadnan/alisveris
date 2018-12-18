<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="sepet.aspx.cs" Inherits="WebApplication1.sepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
  
    <div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th  class="text-center">Price</th>
                        <th  class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody runat="server" visible="false" id="tbody_genel">

                     <asp:Repeater   DataSourceID="SqlDataSource2" runat="server"  ID="Repeater1">
                                                        <ItemTemplate>   

                    <tr  runat="server">
                        <td class="col-sm-8 col-md-6">
                        <div style="" class="media">
                         
                                 <asp:LinkButton runat="server" class="thumbnail pull-left" id="incele_butonu_resim_1211" OnCommand="incele_butonu_Command" CommandArgument='<%# Eval("URUN_ID") %>'>
                        <img style="width:auto;    height:72px;"  src='<%# Eval("URUN_RESMI") %>' />
                              </asp:LinkButton>
                            <div style="" class="media-body">
                               <h4 class="media-heading"> <a><asp:Label text='<%# Eval("URUNADI") %>' runat="server"   ></asp:Label></a></h4>
                                <h5 class="media-heading"> Urun Kodu: <a><asp:Label text='<%# Eval("URUN_ID") %>' runat="server"   ></asp:Label></a></h5>
                                <span>Durum: </span><span class="text-success"><strong>Stok var</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center; ">
                        <asp:TextBox  ID="textbox" OnTextChanged="Uyeler_Sepet_UrunAdeti_TextChanged" AutoPostBack="true"  runat="server"  CssClass="form-control text-center" Text="1" style="margin-top:22px;"></asp:TextBox>
                        </td>


                        <td style=" padding-right:0px; padding-left:0px;" class="col-sm-1 col-md-1 text-center">
                            <span style="margin-top:30px; display:block; height:25px; width:100%; ">
                                <strong style="display:block;">
                                     <asp:Label ID="total_fiyat2" style="color:red;  display:inline;  font-family: 'Roboto', sans-serif;   font-weight: 500; text-align:left;" runat="server"   text='<%# Eval("URUN_FIYATI") %>'>
                                        </asp:Label>
                                            <span style="color:red; display:inline; font-family: 'Roboto', sans-serif;   font-weight: 500;">₺</span> 
                                          </strong>
                                      </span>
                                   </td> 
                     
            
                               <td style="  " class="col-sm-1 col-md-1 text-center">
                            <span style="margin-top:30px; display:block; height:25px; width:100%; ">
                                <strong style="display:block;">
                                     <asp:Label ID="total_fiyat" style="color:red;   display:inline;  font-family: 'Roboto', sans-serif;   font-weight: 500; text-align:left;" runat="server"  text='<%# Eval("URUN_FIYATI") %>'>
                                        </asp:Label>
                                            <span style="color:red; display:inline; font-family: 'Roboto', sans-serif;   font-weight: 500;">₺</span> 
                                          </strong>
                                      </span>
                                   </td> 
                        <td class="col-sm-1 col-md-1">
                       
                             <asp:LinkButton ID="LinkButton3" style="margin-top:20px;"  CssClass="btn btn-danger" CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand=  "LinkButton1_Command"><i class="glyphicon glyphicon-remove"></i>Sil</asp:LinkButton>
                           
                        </td>
                    </tr>
                                                           
                   
    </ItemTemplate>
        
</asp:Repeater>

 <asp:SqlDataSource ID="SqlDataSource2"  runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM temp_urunler where sepet='evet' " ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>">
                    
            </asp:SqlDataSource>

                 
                
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3 style="color:red;  font-family: 'Roboto', sans-serif;"" >Total</h3></td>
                        <td class="text-right"><h3 style="color:red;  font-family: 'Roboto', sans-serif;   " runat="server" id="toplam"><strong>$31.53</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></td>
                        <td>
                        <button type="button" class="btn btn-success">
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
                </tbody>
                 <tbody runat="server" visible="false" id="tbody_ForUye">

                     <asp:Repeater   DataSourceID="SqlDataSource1" runat="server" ID="Repeater2">
                                                        <ItemTemplate>   

                    <tr  runat="server">
                        <td class="col-sm-8 col-md-6">
                        <div style="" class="media">
                         
                                 <asp:LinkButton runat="server" class="thumbnail pull-left" id="incele_butonu_resim_1211" OnCommand="incele_butonu_Command" CommandArgument='<%# Eval("URUN_ID") %>'>
                        <img style="width:auto;    height:72px;"  src='<%# Eval("URUN_RESMI") %>' />
                              </asp:LinkButton>
                            <div style="" class="media-body">
                               <h4 class="media-heading"> <a><asp:Label text='<%# Eval("URUNADI") %>' runat="server"   ></asp:Label></a></h4>
                                <h5 class="media-heading"> Urun Kodu: <a><asp:Label text='<%# Eval("URUN_ID") %>' runat="server"   ></asp:Label></a></h5>
                                <span>Durum: </span><span class="text-success"><strong>Stok var</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center; ">
                        
                            <asp:TextBox  ID="uye_textbox" OnTextChanged="uye_textbox_TextChanged" AutoPostBack="true" runat="server"  CssClass="form-control text-center" Text="1" style="margin-top:22px;"></asp:TextBox>
                        </td>


                        <td style=" padding-right:0px; padding-left:0px;" class="col-sm-1 col-md-1 text-center">
                            <span style="margin-top:30px; display:block; height:25px; width:100%; ">
                                <strong style="display:block;">
                                     <asp:Label ID="total_fiyat_for_uye" style="color:red;  display:inline;  font-family: 'Roboto', sans-serif;   font-weight: 500; text-align:left;" runat="server"   text='<%# Eval("URUN_FIYATI") %>'>
                                        </asp:Label>
                                            <span style="color:red; display:inline; font-family: 'Roboto', sans-serif;   font-weight: 500;">₺</span> 
                                          </strong>
                                      </span>
                                   </td> 
                     
            
                               <td style="  " class="col-sm-1 col-md-1 text-center">
                            <span style="margin-top:30px; display:block; height:25px; width:100%; ">
                                <strong style="display:block;">
                                     <asp:Label ID="total_fiyat_uye"  style="color:red;   display:inline;  font-family: 'Roboto', sans-serif;   font-weight: 500; text-align:left;" runat="server"   text='<%# Eval("URUN_FIYATI") %>'>
                                        </asp:Label>
                                            <span style="color:red; display:inline; font-family: 'Roboto', sans-serif;   font-weight: 500;">₺</span> 
                                          </strong>
                                      </span>
                                   </td> 
                        <td class="col-sm-1 col-md-1">
                       
                             <asp:LinkButton ID="LinkButton3" style="margin-top:20px;"  CssClass="btn btn-danger" CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand=  "LinkButton1_Command"><i class="glyphicon glyphicon-remove"></i>Sil</asp:LinkButton>
                           
                        </td>
                    </tr>
                                                           
                   
    </ItemTemplate>
        
</asp:Repeater>

  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select *from urun_satislar where sepet='evet' and sepet_kayitlari='kayitli' "></asp:SqlDataSource>
             

                
                
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3 style="color:red;  font-family: 'Roboto', sans-serif;"" >Total</h3></td>
                        <td class="text-right"><h3 style="color:red;  font-family: 'Roboto', sans-serif;   " runat="server" id="toplam2"><strong>$31.53</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></td>
                        <td>
                        <button type="button" class="btn btn-success">
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

    


</asp:Content>
