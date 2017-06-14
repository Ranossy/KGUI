------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : hanzhengchun 
-- 创建时间  : 2010-3-3
-- 用途(模块): 师徒系统
-- 道具功能  ：传送
------------------------------------------------

------------------------------------------------
tCityIDToMapID=
{
	[2 ] =2 ,   --wanhua        
	[5 ] =5 ,   --shaolin       
	[6 ] =6 ,   --yangzhou      
	[7 ] =7 ,   --chunyang      
	[8 ] =8 ,   --luoyang       
	[9 ] =9 ,   --luodao        
	[10] =10,   --koudao        
	[11] =11,   --tiance        
	[12] =12,   --fenghuagu     
	[13] =13,   --jinshui       
	[14] =5 ,   --lingxiaoxia   
	[15] =15,   --changan       
	[16] =16,   --qixiu         
	[17] =2 ,   --tiangongfang  
	[18] =16,   --wuyandao      
	[19] =7 ,   --kongwufeng    
	[20] =11,   --sancaizhen    
	[26] =12,   --dihuagong     
	[28] =10,   --rilunshancheng
	[21] =21,--巴陵县  2009/07/09 
	[22] =22,--南屏山  2009/07/09 
	[23] =23,--龙门荒漠  2009/07/09 
	[25] =25,--浩气盟  2009/07/09 
	[27] =27,--恶人谷  2009/07/09 
	[30] =30,--昆仑  2009/07/09 
	[32] = 8,--战宝  2010/2/23 
	[33] =22,--天子峰  2009/07/09 
	[35] =35,--瞿塘峡  2009/07/09 
	[51] =49,   -- jianzhong
	[60] = 5, 	-- 持国天王殿
	[61] =10,   -- 宫中神武	
	[67] =12,   -- 荻花圣殿前山
	[68] =12,   -- 荻花圣殿
	[109] = 108, -- 龙渊泽
	[110] = 103, -- 寂灭厅
	[75] = 104, -- 毒神殿
	[116] = 102, -- 仙踪林
	[106] = 100, -- 法王窟
	[107] = 101, -- 无量宫	
	[108] = 108, -- 成都
	[100] =100,   --白龙口     
	[103] =103,   --融天岭     
	[101] =101,   --无量山     
	[120] =12,    --普通荻花洞窟  
	[122] =122,   --唐门
	[123] =122,   --低级唐门密室
	[125] =122,   --唐门密室
	[130] =12,   --英雄荻花洞窟   
};

function OnRemove(nCharacterID, BuffID, nBuffLevel)
	local bResult = true;	
	if IsPlayer(nCharacterID) then
		local player = GetPlayer(nCharacterID);				
		if not tCityIDToMapID[nBuffLevel] then
			bResult = false;
		else
			player.CastSkill(7307,nBuffLevel); --释放传送技能
		end
			--print("ERR_NODEID_OPEN")
	end
end	

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com