---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/月华_扰心盾提示3.lua
-- 更新时间:	2016/9/30 15:58:21
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene then
		if scene.dwMapID == 240 or scene.dwMapID == 250 then
			if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
				local scene = player.GetScene()
				local yuehua = scene.GetNpcByNickName("yuehua")
				if yuehua and yuehua.bFightState == true then
					player.AddBuff(yuehua.dwID, yuehua.nLevel, 10843, 1)
					player.AddBuff(yuehua.dwID, yuehua.nLevel, 10771, 1)
				end
				--print(12321)
				--player.CastSkill(15984, 1)
			end
		end
		if scene.dwMapID == 248 then
			--if scene.dwMapID == 240 then
			if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
				local scene = player.GetScene()
				local yuehua = scene.GetNpcByNickName("yuehua")
				if yuehua and yuehua.bFightState == true then
					player.AddBuff(yuehua.dwID, yuehua.nLevel, 10843, 2)
					player.AddBuff(yuehua.dwID, yuehua.nLevel, 10771, 2)
				end
				--print(12321)
				--player.CastSkill(15984, 1)
				--	end
			end
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com