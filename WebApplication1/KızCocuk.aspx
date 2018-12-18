<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="KızCocuk.aspx.cs" Inherits="WebApplication1.KızCocuk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


       <div style="background:#0e0e0e; margin-bottom:0px;" class="jumbotron">
  <div class="container">
      <div class="page-header">
  <h2>Yeni & Sezon <small>Sonbahar Sezonu Erkek Çocuk Jeans</small></h2>
           </div>
      <div class="row">
          
            
        <asp:Repeater  DataSourceID="SqlDataSource2" runat="server" ID="Repeater2">
            
    <ItemTemplate>
          <div  class="col-sm-3 " style="box-shadow: 0.5px 0.5px 0.8px #0e0e0e;">
           <div style="border:0.3px solid black;"  class="product-image-wrapper">
                                <div  class="single-products">
                                    <div   class="productinfo text-center">
                                             <asp:LinkButton runat="server" id="incele_butonu_resim" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_kiz_cocuk_1_Command">
                                        <img class="img-responsive" style=""  src='<%# Eval("URUN_RESMI") %>' alt="" runat="server" />
                                       </asp:LinkButton>
                                        <asp:Label style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;" runat="server" class="text-center"  text='<%# Eval("URUN_FIYATI") %>'></asp:Label><span style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;">₺</span><br />
                                    <div style=" height:90px;"> 
                                         <asp:Label style="color:#696763; font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400;" runat="server" class="text-center"  text='<%# Eval("URUNADI") %>'></asp:Label>
                                 </div>
                                        <asp:LinkButton ID="LinkButton1"   CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand="LinkButton1_Command"  CssClass="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Sepete Ekle</asp:LinkButton>
                                     </div>
                                </div>
                                <div style="border:0.3px solid black;"  class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                       <li><<asp:LinkButton runat="server" id="incele_butonu_kiz_cocuk_1" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_kiz_cocuk_1_Command" ><i  class="fa fa-plus-square"></i>İncele</asp:LinkButton></li>
                               </ul>
                                </div>
                            </div>
      </div>
       
    </ItemTemplate>
        
</asp:Repeater>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;temp_urunler&quot;  WHERE KATEGORI_ADI = 'KizCocuk'  "></asp:SqlDataSource>
          
               
          </div>
  
</div>
    </div>
      
           

           



</asp:Content>
