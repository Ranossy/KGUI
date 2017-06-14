------------------------------------------------
-- 文件名    : 经脉具体属性脚本
-- 创建人    : zhangqi
-- 创建时间  : 2009-06-16
-- 用途(模块): 经脉
-- 经脉类型  : 基础系
-- 经脉名称  : 传送BUFF
-- 经脉效果  : 传送BUFF
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
	[49] =49,--藏剑  2010/05/08
	[51] =49,--藏剑剑冢  2010/05/20
	[60] =5,--持国天王殿  2010/06/24
	[61] =10,--宫中神武  2010/06/24
	[67] =12,--荻花圣殿后山  2010/12/31
	[109] =108,   --龙源泽
	[116] =102,   --仙踪林
	[110] =103,   --寂灭厅
	[75 ] =104,   --毒神殿
	[106] =100,   --法王窟
	[107] =101,   --无量宫
	[68] =12,   --荻花圣殿
	[102] =102,   --五毒
	[104] =104,   --黑龙沼
	[108] =108,   --成都
	[100] =100,   --白龙口
	[103] =103,   --融天岭
	[101] =101,   --无量山
	[120] =12,    --普通荻花洞窟
	[122] =122,   --唐门
	[123] =122,   --低级唐门密室
	[125] =122,   --唐门密室
	--[130] =12,   --英雄荻花洞窟
	[133] = 104,	--25人烛龙殿
	[134] = 104,	--10人烛龙殿
	[135] = 105, 	--苍山洱海1
	[136] = 105,    --苍山洱海2
	[137] = 2,    --wanhuaactive
	[140] = 105, --南诏皇宫10人
	[141] = 150, --80明教密道
	[142] = 150, --25明教密道
	[150] = 150, --明教场景
	[155] = 105, --南诏25人
	[151] = 151,	--洛阳_安史之乱	2013/6/8
	[153] = 153,--马嵬驿
	[156] = 156,	--长安_安史之乱	
	[159] = 159,	--丐帮	
	[158] = 158,	--天策_安史之乱	
	[139] = 139,	--枫华谷_安史之乱	
	[160] = 151,	--战宝军械库	
	[171] = 151,	--英雄战宝军械库	
	[161] = 156,	--华清宫	
	[162] = 156,	--英雄华清宫	
	[163] = 156,	--华清宫回忆录	
	[164] = 156,	--大明宫	
	[165] = 156,	--英雄大明宫	
	[169] = 159,	--流离岛	
	[170] = 159,	--英雄流离岛	
	[167] = 153,	--一线天	
	[157] = 153, --英雄一线天
	[172] = 172, --长安内城
};

tMapIDToNodeID=
{
	[2] = {13}, -- 万花
	[5] = {9},  -- 少林
	[6] = {24}, -- 扬州
	[7] = {7},  -- 纯阳
	[8] = {41}, -- 洛阳
	[9] = {21}, -- 洛道
	[11] = {11}, -- 天策
	[12] = {49}, -- 枫华谷
	[13] = {15}, -- 金水镇
	[15] = {36}, -- 长安
	[10] = {47}, -- 寇岛
	[16] = {38},  -- 七秀
	[21] ={97},--巴陵县  2009/07/09
	[22] ={91,108,110},--南屏山  2009/07/09
	[23] ={101},--龙门荒漠  2009/07/09
	[25] ={105},--浩气盟  2009/07/09
	[27] ={116},--恶人谷  2009/07/09
	[30] ={87,117,119},--昆仑  2009/07/09
	[35] ={99},--瞿塘峡  2009/07/09
	[49] ={135},--藏剑  2010/05/08
	[102] ={345},--五毒    2010/05/08
	[104] ={217},--黑龙沼  2011/04/25
	[108] ={440},--成都    2011/04/25
	[100] ={342},--白龙口  2011/04/25
	[103] ={432},--融天岭  2011/04/25
	[101] ={357},--无量山  2011/04/25
	[122] ={516},--唐门  2011/10/27
	[105] = {651}, --苍山洱海 2012/6/26
	[150] = {681}, --明教场景 2012/11/19
	[151] = {902}, --战乱·洛阳 2013/6/8
	[153] = {894}, --马嵬驿 2013/6/8
	[156] = {891}, --战乱·长安 2013/6/8
	[159] = {961}, --丐帮 2013/6/8
	[158] = {913}, --战乱·天策 2013/6/8
	[139] = {928}, --战乱·枫华谷 2013/6/8
	[172] = {1126}, --长安内城 2013/9/16
	
};

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local bResult = true;

	if IsPlayer(nCharacterID) then
		local player = GetPlayer(nCharacterID);


		if not tCityIDToMapID[nBuffLevel] then
			--print("ERR_CITYID_TO_MAPID");
			bResult = false;
		end
		local nMapID = tCityIDToMapID[nBuffLevel];
		--判断玩家是否开通交通点
		if not tMapIDToNodeID[nMapID] then
			--print("ERR_MAPID_TO_NODEID");
			bResult = false;
		elseif 	tMapIDToNodeID[nMapID] then
			for k, v in pairs(tMapIDToNodeID[nMapID]) do
				if player.IsOpenRouteNode(v) then
					nNodeID = v
				end
			end
		end

		if bResult and nNodeID ~= 0 then
			if player.nCamp == 0 and nBuffLevel == 25 then	--判断中立玩家和敌对玩家传送到阵营 特殊处理
				player.SendSystemMessage(GetEditorString(2, 8069))
				--player.CastSkill(1032,22)
				player.AddBuff(0,99,3757,22,1)	--3757buff里面有transmission的魔法属性，buff等级对应nX即1184buff等级
			elseif player.nCamp == 0 and nBuffLevel == 27 then
				player.SendSystemMessage(GetEditorString(2, 8068))
				--player.CastSkill(1032,30)
				player.AddBuff(0,99,3757,30,1)
			elseif player.nCamp == 1 and nBuffLevel == 27 then	--浩气盟玩家想去恶人谷，只能到达昆仑山浩气盟据点
				player.SendSystemMessage(GetEditorString(2, 8068))
				--player.CastSkill(1032,79)
				player.AddBuff(0,99,3757,79,1)
			elseif player.nCamp == 1 and nBuffLevel == 22 then	--浩气盟玩家想去南屏山，到达南屏山浩气盟据点
				--player.CastSkill(1032,77)
				player.AddBuff(0,99,3757,77,1)
			elseif player.nCamp == 1 and nBuffLevel == 30 then	--浩气盟玩家想去昆仑山，到达昆仑山浩气盟据点
			--	player.CastSkill(1032,79)
				player.AddBuff(0,99,3757,79,1)
			elseif player.nCamp == 2 and nBuffLevel == 25 then	--恶人谷玩家想去浩气盟，只能达到南屏山恶人谷据点
				player.SendSystemMessage(GetEditorString(2, 8069))
				--player.CastSkill(1032,78)
				player.AddBuff(0,99,3757,78,1)
			elseif player.nCamp == 2 and nBuffLevel == 22 then	--恶人谷玩家想去南屏山，到达南屏山恶人谷据点
				--player.CastSkill(1032,78)
				player.AddBuff(0,99,3757,78,1)
			elseif player.nCamp == 2 and nBuffLevel == 30 then	--恶人谷玩家想去昆仑山，到达昆仑山恶人谷据点
				--player.CastSkill(1032,80)
				player.AddBuff(0,99,3757,80,1)
			else
				player.AddBuff(0,99,3757,nBuffLevel,1)
			end
			player.AddBuff(0,99,772,1,2)
		else
			--print("ERR_NODEID_OPEN")
		end
	end

end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com