---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳秀岳/柳秀岳_站立监控.lua
-- 更新时间:	2017/4/24 15:21:56
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<

-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("liuxiuyue")
	if not npc then
		return
	end
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH
		and player.nMoveState == MOVE_STATE.ON_STAND then
		if scene.dwMapID == 264 or scene.dwMapID == 272 then
			player.AddBuff(npc.dwID, npc.nLevel, 11910, 1)
		else
			player.AddBuff(npc.dwID, npc.nLevel, 11910, 2)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com