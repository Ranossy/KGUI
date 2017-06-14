---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/剑破回蓝.lua
-- 更新时间:	2017/2/19 23:18:29
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local n = 5 / 100		--百分比
	if npc.nCurrentMana >= npc.nMaxMana - npc.nMaxMana * n then
		npc.nCurrentMana = npc.nMaxMana
	else
		npc.nCurrentMana = npc.nCurrentMana + npc.nMaxMana * n
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com