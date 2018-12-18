<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="urun_detayi.aspx.cs" EnableEventValidation="false" Inherits="WebApplication1.urun_detayi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



	<div  style="" class="container">
			<div class="row">
				
				 
				<div class="col-sm-9 col-sm-offset-3 padding-right">
                 
					<div class="product-details">
                        
                              <asp:Repeater  DataSourceID="SqlDataSource2" runat="server" ID="Repeater2">
            
    <ItemTemplate>
                        
                        
						<div style="" class="col-sm-4 ">
							<div class="view-product">

                                 <asp:LinkButton runat="server" id="incele_butonu_resim_1" CommandArgument='<%# Eval("URUN_ID") %>' OnCommand="incele_butonu_Command">
                                        <img class="img-responsive" style=""  src='<%# Eval("URUN_RESMI") %>' alt="" runat="server" />
                                       </asp:LinkButton>
									
							</div>
                            </div>
                    

						
						<div style="" class="col-sm-8">
							<div style=" padding-left:0px; border:none;" class="product-information">
								<img src="images/urundetayi/yeni.jpg" class="newarrival" alt="" />
                            
                             <div style="" > <asp:Label text='<%# Eval("URUNADI") %>' runat="server" style="color:#363432; font-family:'Robonto',sans-serif; font-size:20px; text-align:left;"  ></asp:Label></div> 
                               
								
						
                            	<span style=" float:left; font-size:14px; font-family: 'Roboto', sans-serif;  margin-right:0px; color: #696763;">Ürün Kodu:</span><asp:Label text='<%# Eval("URUN_ID") %>' runat="server"  style="  float:left; font-size:14px; font-family: 'Roboto', sans-serif; color: #696763;" ></asp:Label>
                             </div>
                              
                  
								<div  style=" ">
								
          <asp:Label style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px; font-weight: 700; text-align:left;" runat="server" class="text-center"  text='<%# Eval("URUN_FIYATI") %>'></asp:Label>
                                        
                                        <span style="color:red; font-family: 'Roboto', sans-serif; font-size: 24px;  font-weight: 700;">₺</span>                  
                                  
                                  <input type="text" style="width:50px; font-size:24px; " class="text-center"  runat="server" value="0" />								
                                    <asp:LinkButton ID="LinkButton1"  style="  text-align:center; margin-top:16px; font-size:20px; font-weight:700;"  CommandArgument='<%# Eval("URUN_ID") %>' runat="server" OnCommand="LinkButton1_Command"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Sepete Ekle</asp:LinkButton>
                              
										
								
									
					
								<p><b>Stok Durumu:</b> Var</p>
								<p><b>Durum:</b> Yeni</p>
								<p><b>Satıcı:</b> keskebenimolsa</p>
								
							</div>
                            
						</div>
                            </ItemTemplate>
        
</asp:Repeater>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM temp_urunler  WHERE incele = 'evet'"></asp:SqlDataSource>
      
					</div>
                  
                
                   

					
					<div style="border:none;"  class="category-tab shop-details-tab">
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#benzer" data-toggle="tab">Benzerleri</a></li>
								<li id="onerlilertag" runat="server"><a href="#oneriler" data-toggle="tab">Kisiye Özel Öneriler</a></li>
                                	<li id="onerilertag2" runat="server"><a href="#oneriler2" data-toggle="tab">Kisiye Özel Öneriler 2</a></li>
								<li><a href="#yorumlar" data-toggle="tab">Yorumlar (5)</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="benzer"  >
 <asp:Repeater  DataSourceID="SqlDataSource3" runat="server" ID="Repeater1">
            
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
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM (select * from temp_urunler ORDER BY URUN_PUANI DESC) urun_puani WHERE incele='hayir' and rownum <= 4 ORDER BY rownum"></asp:SqlDataSource>
      							
							</div>
							
								<div class="tab-pane fade "   id="oneriler" >
                                
                            
                               
 <asp:Repeater  DataSourceID="SqlDataSource11" runat="server" ID="Repeater5">
            
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
           <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT *FROM   (SELECT urunadi, urun_resmi, urun_fiyati,   urun_id, kullanici_id, benzer, incele, satin_al, rownum AS rnum  FROM   (SELECT * FROM  (SELECT urunadi, urun_resmi, urun_fiyati,   urun_id, kullanici_id, benzer, incele, satin_al, Row_number() OVER(PARTITION BY urun_id ORDER BY urun_id  ) rn  FROM   urun_satislar where  benzer='benzerlik3' order by urun_id desc) t ) WHERE rn=1 and rownum <= 10000) WHERE  rnum <= 4 "></asp:SqlDataSource>
         						 </div>
                               <div class="tab-pane fade "  id="oneriler2" >
 <asp:Repeater  DataSourceID="SqlDataSource12" runat="server" ID="Repeater3">
            
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
           <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT *FROM   (SELECT urunadi, urun_resmi, urun_fiyati,   urun_id, kullanici_id, benzer, incele, satin_al, rownum AS rnum  FROM   (SELECT * FROM  (SELECT urunadi, urun_resmi, urun_fiyati,   urun_id, kullanici_id, benzer, incele, satin_al, Row_number() OVER(PARTITION BY urun_id ORDER BY urun_id  ) rn  FROM   urun_satislar where  benzer='benzerlik3' order by urun_id desc) t ) WHERE rn=1 and rownum <= 8) WHERE  rnum >= 5 "></asp:SqlDataSource>
         						

                               
                          




							</div>
							
							<div class="tab-pane fade " id="yorumlar" >
								<div class="col-sm-12">
									<ul>
										<li><a href="#"><i class="fa fa-user"></i>HalilEfe</a></li>
										<li><a href="#"><i class="fa fa-clock-o"></i>12:41 </a></li>
										<li><a href="#"><i class="fa fa-calendar-o"></i>12 NİSAN 2018</a></li>
									</ul>
									<p>Ürünümüz hakkındaki düşüncelerinizi ve puanlarınızı dilediğiniz gibi bizimle paylaşabilirsiniz.</p>
									<p><b>Yorumunuzu Yazın</b></p>
									
									<form action="#">
										<span>
											<input type="text" placeholder="İsminiz"/>
											<input type="email" placeholder="Mail Adresiniz"/>
										</span>
										<textarea name="" ></textarea>
										<b>Puan: </b> <img src="images/urundetayi/yildiz.png" alt="" />
										<button type="button" class="btn btn-default pull-right">
											Gönder
										</button>
									</form>
								</div>
							</div>
							
						</div>
					</div>
					
					
					</div>
				</div>
			</div>
		
	
</asp:Content>
