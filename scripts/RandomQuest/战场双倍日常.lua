---------------------------------------------------------------------->
-- 脚本名称:	scripts/RandomQuest/战场双倍日常.lua
-- 更新时间:	11/17/10 14:20:08
-- 更新用户:	wangxinfeng1
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/Include/Player.lh")
Include("scripts/player/PlayerDeath.lua")
Include("scripts/RandomQuest/通用日期排队.lua")

function OnRandomQuest(player, dwQuestID, dwNpcTemplateID)	
	local BF_TIME_LIST = { 
		[38] = 1, --神农洇
		[48] = 2, --九宫棋谷
		[52] = 3, --70云湖天池
		[50] = 4, --丝绸之路
	}
	local bDouble, nDouble = Get_BF_Double()
	if bDouble and BF_TIME_LIST[nDouble] then		
		return BF_TIME_LIST[nDouble]		
	end
	return  0
end
--local tActStrike_Quest = {
--7855, 7856, 7857, 7859, 
--}
function  CompleteDailyBattleQuest(player)	
	local tBattlefieldList = {
		[38] = true, -- 神农洇
		[48] = true, -- 珍珑棋谷
		[52] = true, -- 云湖天池
		[50] = true, -- 丝绸之路（待开放）
		[135] = true, -- 三国古战场
		[186] = true, -- 浮香丘
	}
	
	local scene = player.GetScene()
	if tBattlefieldList[scene.dwMapID] then
		local dwQuestID = 6010
		local nQuestPhase = player.GetQuestPhase(dwQuestID)
		local nQuestIndex = player.GetQuestIndex(dwQuestID)  
		if nQuestPhase == 1 and player.GetQuestValue(nQuestIndex, 0) == 0 then
			player.SetQuestValue(nQuestIndex, 0, 1) 
		end
		
		-- 2014.3.17预热活动  将赢得战场胜利的分数加入帮会积分
		-- 处理位置：scripts/player/PlayerScript.lua 
		--if not player.GetBuff(7551, 1) then
			--player.AddBuff(0, 99, 7551, 1, 10)
		--end
	end
	--local nQuestIndex_Strike = nil--增加了突袭活动的任务完成脚本
	--for i = 1, #tActStrike_Quest do
	--nQuestIndex_Strike = player.GetQuestIndex(tActStrike_Quest[i])
	--if nQuestIndex_Strike then
	--player.SetQuestValue(nQuestIndex_Strike, 1, 1) 
	--end
	--end
	
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com