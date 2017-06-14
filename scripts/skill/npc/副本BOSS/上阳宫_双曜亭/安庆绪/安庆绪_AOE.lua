---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_双曜亭/安庆绪/安庆绪_AOE.lua
-- 更新时间:	2016/9/12 20:42:21
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
function Apply(dwCharacterID, dwSkillSrcID)
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)

end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	local scene = player.GetScene()
	if scene then
		local anqingxu = scene.GetNpcByNickName("anqingxu")
		if anqingxu and anqingxu.bFightState == true then
			anqingxu.CastSkill(16592, 1)
			anqingxu.PlaySfx(1471, player.nX, player.nY, player.nZ + 150)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com