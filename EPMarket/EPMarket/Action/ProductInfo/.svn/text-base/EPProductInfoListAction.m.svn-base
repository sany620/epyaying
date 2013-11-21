//
//  EPProductInfoListAction.m
//  EPMarket
//
//  Created by cc on 13-2-17.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPProductInfoListAction.h"
#import "EPStatusUtility.h"

@implementation EPProductInfoListAction
@synthesize m_delegate_productinfoList;

- (void)dealloc {
    m_delegate_productinfoList=nil;
    [m_request_productInfoList clearDelegatesAndCancel];
    [m_request_productInfoList release];m_request_productInfoList=nil;
    [super dealloc];
}

/**
 *	@brief	发出请求
 *
 *	请求产品列表
 */
-(void)requestProductInfoListData{
    if (m_request_productInfoList!=nil && [m_request_productInfoList isFinished]) {
        return;
    }
    
    NSMutableDictionary *l_dict;
    if ([(UIViewController*)m_delegate_productinfoList respondsToSelector:@selector(onRequestProductInfoListDataAction)]) {
        l_dict=[NSMutableDictionary dictionaryWithDictionary:[m_delegate_productinfoList onRequestProductInfoListDataAction]];
    }else{
        l_dict=[NSMutableDictionary dictionaryWithCapacity:1];
    }
    
    m_request_productInfoList = [[KDATAWORLD httpEngineCHC]
                                 buildRequest:(NSString *)EP_URL_POST_PRODUCTINFO_LIST
                                 postParams:l_dict
                                 object:self
                                 onFinishedAction:@selector(onRequestProductInfoListDataFinishResponse:)
                                 onFailedAction:@selector(onRequestProductInfoListDataFailResponse:)];
    
    [m_request_productInfoList startAsynchronous];
}

/**
 *	@brief	请求成功
 *
 *	回调函数
 *
 *	@param 	request 	请求对象
 */
-(void)onRequestProductInfoListDataFinishResponse:(ASIHTTPRequest *)request{
    NSString *l_str_response=[request responseString];
    
    NSDictionary *l_dict_response=[l_str_response objectFromJSONString];
    
    if ([EPStatusUtility isRequestJSONSuccess:l_dict_response]) {
        NSArray *l_arr_responselist = [l_dict_response valueForKey:@"data"];
        if ([(UIViewController *)m_delegate_productinfoList respondsToSelector:@selector(onResponseProductInfoListDataSuccess:)]) {
            [m_delegate_productinfoList onResponseProductInfoListDataSuccess:l_arr_responselist];
        }
    }else{
        if ([(UIViewController*)m_delegate_productinfoList respondsToSelector:@selector(onResponseProductInfoListDataFail)]) {
            [m_delegate_productinfoList onResponseProductInfoListDataFail];
        }
    }
    
    m_request_productInfoList=nil;
}

/**
 *	@brief	请求失败
 *
 *	回调函数
 *
 *	@param 	request 	请求对象
 */
-(void)onRequestProductInfoListDataFailResponse:(ASIHTTPRequest *)request{
    if ([(UIViewController*)m_delegate_productinfoList respondsToSelector:@selector(onResponseProductInfoListDataFail)]) {
        [m_delegate_productinfoList onResponseProductInfoListDataFail];
    }
    
    m_request_productInfoList=nil;
}

@end
