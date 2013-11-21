//
//  EPNewZealandListAction.h
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPBaseAction.h"

@protocol EPNewZealandListActionDelegate

-(NSDictionary*)onRequestNewZealandListDataAction;
-(void)onResponseNewZealandListDataSuccess:(NSArray*)l_array_list pageData:(EPPageData*)l_data_page;
-(void)onResponseNewZealandListDataFail;

@end

@interface EPNewZealandListAction : EPBaseAction{
    ASIHTTPRequest *m_request_newZealandList;
    id<EPNewZealandListActionDelegate> m_delegate_newZealandList;
}
@property(nonatomic,assign)id<EPNewZealandListActionDelegate> m_delegate_newZealandList;

/**
 *	@brief	发出请求
 *	
 *	请求新西兰速递列表
 */
-(void)requestNewZealandListData;

/**
 *	@brief	请求成功
 *	
 *	回调函数
 *
 *	@param 	request 	请求对象
 */
-(void)onRequestNewZealandListDataFinishResponse:(ASIHTTPRequest*)request;
/**
 *	@brief	请求失败
 *	
 *	回调函数
 *
 *	@param 	request 	请求对象
 */
-(void)onRequestNewZealandListDataFailResponse:(ASIHTTPRequest*)request;
@end
