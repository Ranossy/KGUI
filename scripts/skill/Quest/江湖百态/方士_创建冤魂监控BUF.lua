---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_创建冤魂监控BUF.lua
-- 更新时间:	2016/6/14 10:50:17
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Map/江湖百态/方士/include/方士_Data.lua")
Include("scripts/Map/逐鹿中原/include/据点争夺_Data.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(10842, 1)
	if buff then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if player.dwIdentityVisiableID ~= 0 then
		return
	end
	--大小攻防时不能释放此技能
	if CastleFight.CheckPrepareTime() then
		local tActivityMap = CastleFight.GetMapActivityState()
		if tActivityMap[scene.dwMapID] then
			return
		end
	end
	--已经被追踪则跳出判断，用BUFF判断会有一帧误差，直接判断NPC是否存在
	local ghost_npc = scene.GetNpcByNickName("Identity_Ghost" .. player.dwID) or scene.GetNpcByNickName("Identity_Ghost" .. player.dwID .. "Out")
	if ghost_npc then
		return
	end
	------------判断是不是可用场景，0是野外、门派地图-----------
	if scene.nType ~= 0 then
		player.DelBuff(10841, 1)
		return
	end
	local tSceneList = {
		[6] = 1, [150] = 1, [102] = 1, [193] = 1, [158] = 1
	}
	if not tSceneList[scene.dwMapID] then
		return
	end
	------------只有行走、站立和静止状态可以创建鬼魂------------------
	if player.nMoveState ~= MOVE_STATE.ON_STAND and player.nMoveState ~= MOVE_STATE.ON_SIT and player.nMoveState ~= MOVE_STATE.ON_WALK then
		return
	end
	Identity_CreatGhost1_5(player, 1)      --创建魂灵
	--local nRate_Ghost1 = Random(1000000)    --0.01%，100 单人魂概率
	--local nRate_Ghost2 = Random(1000000)    --0.0005%，5 ，5人魂概率
	local nRate_Ghost1 = Random(100)    --0.01%，100 单人魂概率
	local nRate_Ghost2 = Random(100)    --0.0005%，5 ，5人魂概率
	local nTimes = 10
	if nRate_Ghost1 == 50 then	-- 暂时调整为1%
		local nIndex = 1
		local nRandom = Random(1000000)
		if nRandom <= 700000 then
			nIndex = 1
		elseif nIndex <= 990000 then
			nIndex = 2
		else
			nIndex = 3
		end
		Identity_CreatGhost1_5(player, nIndex)      --创建魂灵
	elseif nRate_Ghost2 < 105 * nTimes then         
		--RemoteCallToCenter("On_Identity_CheckCD", player.dwID, 5)     --判断服务器CD限制,玩家或NPC ID，鬼魂强度	
	end
	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com