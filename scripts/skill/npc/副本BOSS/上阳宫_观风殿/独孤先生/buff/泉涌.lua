---------------------------------------------------------------------->
-- 脚本名称:	scripts\skill\npc\副本BOSS\上阳宫_观风殿\独孤先生\buff\泉涌.lua
-- 更新时间:	2014/7/14 17:06:43
-- 更新用户:	ZHENGYUCHAO
-- 脚本说明:
----------------------------------------------------------------------<

Include("scripts/Map/上阳宫_观风殿/include/独孤先生通用数据.lua")

-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local targetPlayer = GetPlayer(dwCharacterID)
	if targetPlayer then
		local commonData = DuguData[targetPlayer.GetMapID()]
		if not commonData then
			return
		end
		local scene = targetPlayer.GetScene()
		local hpCostRate = commonData.QYDebuffHpCostPercent / 100 
		
		local damageCost = hpCostRate * targetPlayer.nMaxLife

		local bossNickName = commonData.DGXSNickName
		local scene = targetPlayer.GetScene()
		local myBoss = scene.GetNpcByNickName(bossNickName)

		if myBoss then
			targetPlayer.CustomDamage(myBoss.dwID, commonData.QYFinallySkillID, commonData.QYFinallySkillLevel, 3, damageCost)
			targetPlayer.PlaySfx(43, targetPlayer.nX, targetPlayer.nY, targetPlayer.nZ)
		end
	end
end
-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com