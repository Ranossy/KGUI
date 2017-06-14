---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/逐鹿中原/据点大旗附近判断.lua
-- 更新时间:	2016/12/6 15:49:05
-- 更新用户:	qinfupi
-- 脚本说明:	用于矿车给周围的玩家加分。每3秒跳一次，在On_PQ.lua里面直接添加。好孩子不要学。
----------------------------------------------------------------------<
Include("scripts/Map/逐鹿中原/include/据点争夺_Data.lh")

--地图和据点ID表
local tMapAndJuDianID =
{
	[30] = {301,301},	--补足两个，方便访问数组
	[22] = {221,221},	--补足两个，方便访问数组
	[23] = {231,232},
	[153] = {1531,1532},
	[103] = {1031,1032},
	[104] = {1041,1042},
	[139] = {1391,1392},
	[35] = {351,352},
	[100] = {1001,1002},
	[101] = {1011,1012},
	[13] = {131,132},
	[9] = {91,92},
	[21] = {211,212},
	[105] = {1051,1052},
}

-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--活动未开启的话也可以返回了
	local StateInfo = GetActivityState(378)
	if not StateInfo then
		if player.GetBuff(11564,1) then 	--删除战意buff
			player.DelBuff(11564,1)
		end
		return
	end
	if not(StateInfo == ACTIVITY_STATE.NORMAL_ON or StateInfo == ACTIVITY_STATE.RECOVER_ON) then
		if player.GetBuff(11564,1) then 	--删除战意buff
			player.DelBuff(11564,1)
		end
		return
	end
	
	--死人不加增益buff
	if player.nMoveState == MOVE_STATE.ON_DEATH then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	
	--中立不加增益buff
	if player.nCamp == CAMP.NEUTRAL and player.GetBuff(11564, 1) then
		player.DelBuff(11564, 1)
		return
	end
	
	--太虚状态不加
	if player.GetBuff(961, 1) then
		return
	end

	if player.dwIdentityVisiableID ~= 0 and player.dwIdentityVisiableID ~= 6 then	-- 位面判断
		return
	end
	
	-- 驭兽状态判断
	if player.GetBuff(10864, 1) then	
		return
	end
	
	--正式判断
	local nMapID = scene.dwMapID
	local sNickName = "DaQiZhaoZi_"

	if tMapAndJuDianID[nMapID] then	--在沙盘地图
		local sZhaoZiName1 = sNickName .. tMapAndJuDianID[nMapID][1]		
		local npcZhaoZi1 = scene.GetNpcByNickName(sZhaoZiName1)
		local sZhaoZiName2 = sNickName .. tMapAndJuDianID[nMapID][2]
		local npcZhaoZi2 = scene.GetNpcByNickName(sZhaoZiName2)
		if npcZhaoZi1 and GetCharacterDistance(npcZhaoZi1.dwID, player.dwID) < 960 then --和第一个旗子15尺之内				
			local CastleData = CastleFight.GetCastleData(tMapAndJuDianID[nMapID][1])
			local nCamp = CastleData.GetInt8(Castle_Value_Name.Camp)
			if nCamp == player.nCamp and not player.GetBuff(11564, 1) then 				--己方阵营且身上无战意buff
				player.AddBuff(0, 99, 11564, 1)
			end
		elseif npcZhaoZi2 and GetCharacterDistance(npcZhaoZi2.dwID, player.dwID) < 960 then	--和第二个旗子15尺之内
			local CastleData = CastleFight.GetCastleData(tMapAndJuDianID[nMapID][2])
			local nCamp = CastleData.GetInt8(Castle_Value_Name.Camp)
			if nCamp == player.nCamp and not player.GetBuff(11564, 1) then 				--己方阵营且身上无战意buff
				player.AddBuff(0,99,11564,1)
			end	
		else
			if player.GetBuff(11564, 1) then 	--不在两个大旗点附近
				player.DelBuff(11564,1)
			end	
		end
	else	--不在沙盘地图
		if player.GetBuff(11564, 1) then
			player.DelBuff(11564,1)
		end
		if player.GetBuff(11561, 1) then
			player.DelBuff(11561,1)
		end	
	end	
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com