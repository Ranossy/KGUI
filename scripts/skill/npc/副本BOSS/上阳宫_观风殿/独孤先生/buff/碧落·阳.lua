---------------------------------------------------------------------->
-- 脚本名称:	scripts\skill\npc\副本BOSS\上阳宫_观风殿\独孤先生\buff\碧落·阳.lua
-- 更新时间:	2014/7/14 17:06:43
-- 更新用户:	ZHENGYUCHAO
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Map/上阳宫_观风殿/include/独孤先生通用数据.lua")

-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	
	local myBoss = GetNpc(dwCharacterID)
	if not myBoss then
		return
	end

	local commonData = DuguData[myBoss.GetMapID()]
	local scene = myBoss.GetScene()

	local distanceToDamage = commonData.CantCloseDistance
	local distanceAsPoint = distanceToDamage * 64
	
	
	local tPlayerList = scene.GetAllPlayer()
	for i = 1, #tPlayerList do
		local thisPlayerID = tPlayerList[i]
		local thisPlayer = GetPlayer(tPlayerList[i])
		if thisPlayer and thisPlayer.nMoveState ~= MOVE_STATE.ON_DEATH and thisPlayer.dwIdentityVisiableID == 0 then
			local xdis = myBoss.nX - thisPlayer.nX
			local ydis = myBoss.nY - thisPlayer.nY
			
			if  (xdis * xdis + ydis * ydis) < (distanceAsPoint * distanceAsPoint) then
				local damageCost = thisPlayer.nMaxLife * commonData.BiLuoHpCostPercent / 100
				thisPlayer.CustomDamage(myBoss.dwID, commonData.BiLuoChantSkillID, commonData.BiLuoChantSkillLevel, 1, damageCost)
			end
		end
	end
end
-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com