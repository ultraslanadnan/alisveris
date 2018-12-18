<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" enableEventValidation="false"  CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





       <section  style="background:#fff; margin-top:0px;" id="slider">
       
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="1"></li>
                            <li data-target="#slider-carousel" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-6">
                                    <h1>ALIŞVERİŞ ÇILGINLIĞI</h1>
                                    <h2>Çıkış yapmakta zorlanacaksınız..</h2>
                                    <button  type="button" class="btn btn-default  get">Şimdi Al</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="images/anasayfa/kız11.jpg" class="girl img-responsive" alt="" />

                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1>ALIŞVERİŞ ÇILGINLIĞI</h1>
                                    <h2>Aradığınız herşey bir tık uzağınızda..</h2>
                                    <button type="button" class="btn btn-default get">Şimdi Al</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="images/anasayfa/kız22.jpg" class="girl img-responsive" alt="" />

                                </div>
                            </div>

                            <div class="item">
                                <div class="col-sm-6">
                                    <h1>ALIŞVERİŞ ÇILGINLIĞI</h1>
                                    <h2>Alışverişin uğurlu adresi..</h2>
                                    <button type="button" class="btn btn-default get">Şimdi Al</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="images/anasayfa/kız33.jpg" class="girl img-responsive" alt="" />

                                </div>
                            </div>
                        </div>

                        </div>

                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>

                </div>
            </div>
        
    </section>
   
   

     <div style="background:#0e0e0e; margin-bottom:0px;" class="jumbotron">
         <div class="container">
          <div class="recommended_items">

                        <h2 style="color:red;" class="title text-center">En Çok Satanlar</h2>

                        <div  id="recommended-item-carousel" class="carousel slide" data-interval="false" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item active">
                                   <asp:Repeater  DataSourceID="SqlDataSource4" runat="server" ID="Repeater4">
            
    <ItemTemplate>
                                    <div class="col-sm-3">
                                        <div style="border:none;" class="product-image-wrapper">
                                           <div  class="single-products">
                                    <div   class="productinfo text-center">
                                         <asp:LinkButton runat="server" id="incele_butonu_resim_1" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command">
                                        <img class="img-responsive" style=""  src='<%# Eval("URUN_RESMI") %>' alt="" runat="server" />
                                       </asp:LinkButton>
                                        <asp:Label style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;" runat="server" class="text-center"  text='<%# Eval("URUN_FIYATI") %>'></asp:Label><span style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;">₺</span><br />
                                 <div style=" height:90px;"> 
                                         <asp:Label style="color:#696763; font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400;" runat="server" class="text-center"  text='<%# Eval("URUNADI") %>'></asp:Label>
                                 </div>
                                        
                                          <asp:LinkButton ID="LinkButton1"   CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand="LinkButton1_Command"  CssClass="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Sepete Ekle</asp:LinkButton>
                              
                                                </div>
                                </div>
                                        </div>
                                    </div>
                                   </ItemTemplate> 
</asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM (SELECT * FROM TEMP_URUNLER ORDER BY URUN_PUANI DESC) URUN_PUANI WHERE ROWNUM <= 4 ORDER BY ROWNUM"></asp:SqlDataSource>
      
                                </div>
                                 <div class="item">
                                   <asp:Repeater  DataSourceID="SqlDataSource5" runat="server" ID="Repeater5">
            
    <ItemTemplate>
                                    <div class="col-sm-3">
                                        <div style="border:none;" class="product-image-wrapper">
                                           <div  class="single-products">
                                    <div   class="productinfo text-center">
                                   <asp:LinkButton runat="server" id="incele_butonu_resim_2" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command">
                                        <img class="img-responsive" style=""  src='<%# Eval("URUN_RESMI") %>' alt="" runat="server" />
                                       </asp:LinkButton>


                                        <asp:Label style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;" runat="server" class="text-center"  text='<%# Eval("URUN_FIYATI") %>'></asp:Label><span style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;">₺</span><br />
                                  <div style=" height:90px;"> 
                                         <asp:Label style="color:#696763; font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400;" runat="server" class="text-center"  text='<%# Eval("URUNADI") %>'></asp:Label>
                                 </div>
                                          <asp:LinkButton ID="LinkButton2"   CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand="LinkButton1_Command"  CssClass="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Sepete Ekle</asp:LinkButton>
                              
                                                </div>
                                </div>
                                        </div>
                                    </div>
                                   </ItemTemplate>
        
 </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT *FROM   (SELECT urunadi, urun_fiyati, urun_puani, urun_resmi, urun_id, kategori_adi, urun_kategori,  rownum AS rnum  FROM   (SELECT * FROM   temp_urunler ORDER BY urun_puani desc) WHERE rownum <= 8) WHERE  rnum >= 5 "></asp:SqlDataSource>
      
                                </div>

                            </div>
                            <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </div>
             </div>
         </div>
    <div style="background:#0e0e0e;" class="container">
  <div style="border:none;"  class="category-tab shop-details-tab">
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#erkekgiyim" data-toggle="tab">Erkek Giyim</a></li>
								<li id="onerlilertag" runat="server"><a href="#kadingiyim" data-toggle="tab">Kadın Giyim</a></li>
                                	<li id="onerilertag2" runat="server"><a href="#erkekcocukgiyim" data-toggle="tab">Erkek Çocuk Giyim</a></li>
								<li><a href="#kizcocukgiyim" data-toggle="tab">Kız Çocuk Giyim</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="erkekgiyim"  >
 <asp:Repeater  DataSourceID="SqlDataSource1111" runat="server" ID="Repeater1">
            
    <ItemTemplate>
          <div  class="col-sm-3 " style="box-shadow: 0.5px 0.5px 0.8px #0e0e0e;">
           <div style="border:0.3px solid #0e0e0e;"  class="product-image-wrapper">
                                <div  class="single-products">
                                    <div   class="productinfo text-center">
                                           <asp:LinkButton runat="server" id="incele_butonu_resim_2" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command">
                                        <img class="img-responsive" style=""  src='<%# Eval("URUN_RESMI") %>' alt="" runat="server" />
                                       </asp:LinkButton>
                                      <div style=" height:90px;">  <asp:Label style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;" runat="server" class="text-center"  text='<%# Eval("URUN_FIYATI") %>'></asp:Label>
                                          
                                          <span style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;">₺</span><br />
                                
                                            <asp:Label style="color:#696763; font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400;" runat="server" class="text-left"  text='<%# Eval("URUNADI") %>'></asp:Label>
                                 </div>
                                        
                                        <asp:LinkButton ID="Benzerleri_Sepete_Ekle"   CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand="LinkButton1_Command" CssClass="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Sepete Ekle</asp:LinkButton>
                                     </div>
                                </div>
                                <div style="border:0.3px solid #0e0e0e;"  class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                       <li><asp:LinkButton runat="server" id="incele_butonu" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command"   ><i  class="fa fa-plus-square"></i>İncele</asp:LinkButton></li>
                                       </ul>
                                </div>
                            </div>
      </div>
       
    </ItemTemplate>
        
</asp:Repeater>
          <asp:SqlDataSource ID="SqlDataSource1111" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select *from temp_urunler where kategori_adi='ErkekGiyim' and rownum<=4 order by urun_puani desc"></asp:SqlDataSource>
      							
							</div>
                            <div class="tab-pane fade " id="kadingiyim"  >
 <asp:Repeater  DataSourceID="SqlDataSource2222" runat="server" ID="Repeater2">
            
    <ItemTemplate>
          <div  class="col-sm-3 " style="box-shadow: 0.5px 0.5px 0.8px #0e0e0e;">
           <div style="border:0.3px solid #0e0e0e;"  class="product-image-wrapper">
                                <div  class="single-products">
                                    <div   class="productinfo text-center">
                                           <asp:LinkButton runat="server" id="incele_butonu_resim_2" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command">
                                        <img class="img-responsive" style=""  src='<%# Eval("URUN_RESMI") %>' alt="" runat="server" />
                                       </asp:LinkButton>
                                      <div style=" height:90px;">  <asp:Label style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;" runat="server" class="text-center"  text='<%# Eval("URUN_FIYATI") %>'></asp:Label>
                                          
                                          <span style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;">₺</span><br />
                                
                                            <asp:Label style="color:#696763; font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400;" runat="server" class="text-left"  text='<%# Eval("URUNADI") %>'></asp:Label>
                                 </div>
                                        
                                        <asp:LinkButton ID="Benzerleri_Sepete_Ekle"   CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand="LinkButton1_Command" CssClass="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Sepete Ekle</asp:LinkButton>
                                     </div>
                                </div>
                                <div style="border:0.3px solid #0e0e0e;"  class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                       <li><asp:LinkButton runat="server" id="incele_butonu" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command"   ><i  class="fa fa-plus-square"></i>İncele</asp:LinkButton></li>
                                       </ul>
                                </div>
                            </div>
      </div>
       
    </ItemTemplate>
        
</asp:Repeater>
          <asp:SqlDataSource ID="SqlDataSource2222" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select *from temp_urunler where kategori_adi='KadinGiyim' and rownum<=4 order by urun_puani desc"></asp:SqlDataSource>
      							
							</div>
                             <div class="tab-pane fade " id="erkekcocukgiyim"  >
 <asp:Repeater  DataSourceID="SqlDataSource3333" runat="server" ID="Repeater3">
            
    <ItemTemplate>
          <div  class="col-sm-3 " style="box-shadow: 0.5px 0.5px 0.8px #0e0e0e;">
           <div style="border:0.3px solid #0e0e0e;"  class="product-image-wrapper">
                                <div  class="single-products">
                                    <div   class="productinfo text-center">
                                           <asp:LinkButton runat="server" id="incele_butonu_resim_2" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command">
                                        <img class="img-responsive" style=""  src='<%# Eval("URUN_RESMI") %>' alt="" runat="server" />
                                       </asp:LinkButton>
                                      <div style=" height:90px;">  <asp:Label style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;" runat="server" class="text-center"  text='<%# Eval("URUN_FIYATI") %>'></asp:Label>
                                          
                                          <span style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;">₺</span><br />
                                
                                            <asp:Label style="color:#696763; font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400;" runat="server" class="text-left"  text='<%# Eval("URUNADI") %>'></asp:Label>
                                 </div>
                                        
                                        <asp:LinkButton ID="Benzerleri_Sepete_Ekle"   CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand="LinkButton1_Command" CssClass="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Sepete Ekle</asp:LinkButton>
                                     </div>
                                </div>
                                <div style="border:0.3px solid #0e0e0e;"  class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                       <li><asp:LinkButton runat="server" id="incele_butonu" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command"   ><i  class="fa fa-plus-square"></i>İncele</asp:LinkButton></li>
                                       </ul>
                                </div>
                            </div>
      </div>
       
    </ItemTemplate>
        
</asp:Repeater>
          <asp:SqlDataSource ID="SqlDataSource3333" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select *from temp_urunler where kategori_adi='ErkekCocuk' and rownum<=4 order by urun_puani desc"></asp:SqlDataSource>
      							
							</div>
                             <div class="tab-pane fade " id="kizcocukgiyim"  >
 <asp:Repeater  DataSourceID="SqlDataSource4444" runat="server" ID="Repeater6">
            
    <ItemTemplate>
          <div  class="col-sm-3 " style="box-shadow: 0.5px 0.5px 0.8px #0e0e0e;">
           <div style="border:0.3px solid #0e0e0e;"  class="product-image-wrapper">
                                <div  class="single-products">
                                    <div   class="productinfo text-center">
                                           <asp:LinkButton runat="server" id="incele_butonu_resim_2" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command">
                                        <img class="img-responsive" style=""  src='<%# Eval("URUN_RESMI") %>' alt="" runat="server" />
                                       </asp:LinkButton>
                                      <div style=" height:90px;">  <asp:Label style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;" runat="server" class="text-center"  text='<%# Eval("URUN_FIYATI") %>'></asp:Label>
                                          
                                          <span style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700;">₺</span><br />
                                
                                            <asp:Label style="color:#696763; font-family: 'Roboto', sans-serif; font-size: 14px; font-weight: 400;" runat="server" class="text-left"  text='<%# Eval("URUNADI") %>'></asp:Label>
                                 </div>
                                        
                                        <asp:LinkButton ID="Benzerleri_Sepete_Ekle"   CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand="LinkButton1_Command" CssClass="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Sepete Ekle</asp:LinkButton>
                                     </div>
                                </div>
                                <div style="border:0.3px solid #0e0e0e;"  class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                       <li><asp:LinkButton runat="server" id="incele_butonu" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command"   ><i  class="fa fa-plus-square"></i>İncele</asp:LinkButton></li>
                                       </ul>
                                </div>
                            </div>
      </div>
       
    </ItemTemplate>
        
</asp:Repeater>
          <asp:SqlDataSource ID="SqlDataSource4444" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select *from temp_urunler where kategori_adi='KizCocuk' and rownum<=4 order by urun_puani desc"></asp:SqlDataSource>
      							
							</div>
							
							
							
						</div>
					</div>
      </div>
   
</asp:Content>
