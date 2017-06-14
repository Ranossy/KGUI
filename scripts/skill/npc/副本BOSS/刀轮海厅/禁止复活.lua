---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/禁止复活.lua
-- 更新时间:	2017/3/9 14:52:41
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.DelBuff(2313, 1)		--删除凤凰蛊的buff
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com