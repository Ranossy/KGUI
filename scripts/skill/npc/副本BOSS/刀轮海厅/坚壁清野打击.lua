---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/坚壁清野打击.lua
-- 更新时间:	2017/2/19 20:42:08
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<

-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)		--被加了buff的npc，即boss
	if not  npc then
		return
	end
	npc.CastSkill(17387, 1)
	npc.AddBuff(npc.dwID, npc.nLevel, 11722, 1)		--打击监控
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com