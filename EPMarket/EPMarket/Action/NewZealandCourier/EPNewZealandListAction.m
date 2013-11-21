//
//  EPNewZealandListAction.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPNewZealandListAction.h"
#import "EPStatusUtility.h"
#import "EPNewZealandListData.h"

@implementation EPNewZealandListAction
@synthesize m_delegate_newZealandList;

- (void)dealloc {
    m_delegate_newZealandList=nil;
    [m_request_newZealandList clearDelegatesAndCancel];
    [m_request_newZealandList release];m_request_newZealandList=nil;
    [super dealloc];
}

/**
 *	@brief	发出请求
 *	
 *	请求新西兰速递列表
 */
-(void)requestNewZealandListData{
    if (m_request_newZealandList!=nil && [m_request_newZealandList isFinished]) {
        return;
    }
    NSDictionary *l_dict_request;
    if ([(UIViewController*)m_delegate_newZealandList respondsToSelector:@selector(onRequestNewZealandListDataAction)]) {
        l_dict_request=[m_delegate_newZealandList onRequestNewZealandListDataAction];
    }else{
        l_dict_request=[[[NSDictionary alloc] init] autorelease];
    }
    
    m_request_newZealandList=[[KDATAWORLD httpEngineCHC] 
                              startDefaultAsynchronousRequest:(NSString *)EP_URL_GET_NewZealand_List 
                              getParams:l_dict_request 
                              object:self 
                              onFinishedAction:@selector(onRequestNewZealandListDataFinishResponse:) 
                              onFailedAction:@selector(onRequestNewZealandListDataFailResponse:)];
}

/**
 *	@brief	请求成功
 *	
 *	回调函数
 *
 *	@param 	request 	请求对象
 */
-(void)onRequestNewZealandListDataFinishResponse:(ASIHTTPRequest*)request{
    NSString *l_str_response=[request responseString];
    
    NSDictionary *l_dict_response=[l_str_response objectFromJSONString];
    
    if ([EPStatusUtility isRequestJSONSuccess:l_dict_response]) {
        
        EPPageData *l_data_page=[[EPPageData alloc] init];
        l_data_page.mallCount=[l_dict_response objectForKey:@"allcount"];
        
        NSMutableArray *l_arr_list=[NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *l_dict_item in [l_dict_response objectForKey:@"data"]) {
            
            EPNewZealandListData *l_data_newZealand=[[EPNewZealandListData alloc] init];
            l_data_newZealand.mid=[l_dict_item objectForKey:@"id"];
            l_data_newZealand.mtitle=[l_dict_item objectForKey:@"title"];
            l_data_newZealand.mphoto=[l_dict_item objectForKey:@"photo"];
            l_data_newZealand.mcontent=[l_dict_item objectForKey:@"content"];
            l_data_newZealand.mcreated=[l_dict_item objectForKey:@"created"];
            l_data_newZealand.mimageWidth=@"200";
            l_data_newZealand.mimageHeight=@"300";
            
            [l_arr_list addObject:l_data_newZealand];
            [l_data_newZealand release];
        }
        
        if ([(UIViewController*)m_delegate_newZealandList respondsToSelector:@selector(onResponseNewZealandListDataSuccess:pageData:)]) {
            [m_delegate_newZealandList onResponseNewZealandListDataSuccess:l_arr_list pageData:l_data_page];
        }
        
        [l_data_page release];
    }else{
        if ([(UIViewController*)m_delegate_newZealandList respondsToSelector:@selector(onResponseNewZealandListDataFail)]) {
            [m_delegate_newZealandList onResponseNewZealandListDataFail];
        }
    }
    
    m_request_newZealandList=nil;
}

/**
 *	@brief	请求失败
 *	
 *	回调函数
 *
 *	@param 	request 	请求对象
 */
-(void)onRequestNewZealandListDataFailResponse:(ASIHTTPRequest*)request{
    
    if ([(UIViewController*)m_delegate_newZealandList respondsToSelector:@selector(onResponseNewZealandListDataFail)]) {
        [m_delegate_newZealandList onResponseNewZealandListDataFail];
    }
    
    m_request_newZealandList=nil;
}

@end
