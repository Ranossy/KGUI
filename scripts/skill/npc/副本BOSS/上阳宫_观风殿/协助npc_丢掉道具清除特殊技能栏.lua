---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/协助npc_丢掉道具清除特殊技能栏.lua
-- 更新时间:	2016/8/26 16:18:00
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if player.GetItemAmount(5, 26719) < 1 then
			player.SetDynamicSkillGroup(0)
			player.DelBuff(11131, 1)
			local LiFu = scene.GetNpcByNickName("LiFu")
			local LiChengEn = scene.GetNpcByNickName("LiChengEn")
			if LiFu then
				LiFu.DelBuff(11345, 1)
			end

			if LiChengEn then
				LiChengEn.DelBuff(11345, 1)
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com