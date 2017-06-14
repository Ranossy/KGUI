---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/月华_持续AOE毒性BUFF.lua
-- 更新时间:	2016/9/6 20:48:41
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene then
		local yuehua = scene.GetNpcByNickName("yuehua")
		if yuehua and yuehua.bFightState == true then
			if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
				--player.PlaySfx(1179, player.nX, player.nY, player.nZ)
				--player.CastSkill(15633, 1)
				--player.DelBuff(9585, 1)
				yuehua.CastSkillXYZ(15633, 1, player.nX, player.nY, player.nZ)
				yuehua.PlaySfx(1458, player.nX, player.nY, player.nZ)
			end
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com