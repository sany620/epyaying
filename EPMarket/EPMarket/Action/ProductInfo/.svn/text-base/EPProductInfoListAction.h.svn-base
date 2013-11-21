//
//  EPProductInfoListAction.h
//  EPMarket
//
//  Created by cc on 13-2-17.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPBaseAction.h"

@protocol EPProductInfoListActionDelegate

-(NSDictionary*)onRequestProductInfoListDataAction;
-(void)onResponseProductInfoListDataSuccess:(NSArray*)l_array_list;
-(void)onResponseProductInfoListDataFail;

@end

@interface EPProductInfoListAction : EPBaseAction{
    ASIHTTPRequest *m_request_productInfoList;
    id<EPProductInfoListActionDelegate> m_delegate_productinfoList;
}
@property(nonatomic,assign)id<EPProductInfoListActionDelegate> m_delegate_productinfoList;

/**
 *	@brief	发出请求
 *
 *	请求产品列表
 */
-(void)requestProductInfoListData;

/**
 *	@brief	请求成功
 *
 *	回调函数
 *
 *	@param 	request 	请求对象
 */
-(void)onRequestProductInfoListDataFinishResponse:(ASIHTTPRequest*)request;
/**
 *	@brief	请求失败
 *
 *	回调函数
 *
 *	@param 	request 	请求对象
 */
-(void)onRequestProductInfoListDataFailResponse:(ASIHTTPRequest*)request;
@end
