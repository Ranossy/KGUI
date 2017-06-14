---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/item/苍云特殊武器_武器中寻首击山倒计时buff.lua
-- 更新时间:	2016/6/8 16:31:22
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.DoAction(0, 60122)
		player.DelBuff(8576, 1)
		player.DelBuff(10821, 1)
		player.DelBuff(10823, 1)
		player.DelBuff(10824, 1)
		player.DelBuff(10825, 1)
		player.SetDynamicSkillGroup(0)
		if player.nCurrentRage < player.nMaxRage * 0.2 then
			player.CastSkill(15995, 1)
			player.nCurrentRage = 0
		end

		if player.nCurrentRage >= player.nMaxRage * 0.2 and player.nCurrentRage < player.nMaxRage * 0.4 then
			player.CastSkill(15995, 2)
			player.nCurrentRage = player.nCurrentRage - player.nMaxRage * 0.2
		end

		if player.nCurrentRage >= player.nMaxRage * 0.4 and player.nCurrentRage < player.nMaxRage * 0.6 then
			player.CastSkill(15995, 3)
			player.nCurrentRage = player.nCurrentRage - player.nMaxRage * 0.4
		end

		if player.nCurrentRage >= player.nMaxRage * 0.6 and player.nCurrentRage < player.nMaxRage * 0.8 then
			player.CastSkill(15995, 4)
			player.nCurrentRage = player.nCurrentRage - player.nMaxRage * 0.6
		end

		if player.nCurrentRage >= player.nMaxRage * 0.8 and player.nCurrentRage < player.nMaxRage * 1 then
			player.CastSkill(15995, 5)
			player.nCurrentRage = player.nCurrentRage - player.nMaxRage * 0.8
		end

		if player.nCurrentRage == player.nMaxRage then
			player.CastSkill(15995, 6)
			player.nCurrentRage = player.nCurrentRage - 100
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com