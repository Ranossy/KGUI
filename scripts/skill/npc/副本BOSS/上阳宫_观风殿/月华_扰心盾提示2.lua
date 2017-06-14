---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/月华_扰心盾提示2.lua
-- 更新时间:	2016/9/22 17:22:05
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		local scene = player.GetScene()
		local yuehua = scene.GetNpcByNickName("yuehua")
		if yuehua and yuehua.bFightState == true then
			player.AddBuff(yuehua.dwID, yuehua.nLevel, 11293, 1)
		end
		--print(12321)
		--player.CastSkill(15984, 1)
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com