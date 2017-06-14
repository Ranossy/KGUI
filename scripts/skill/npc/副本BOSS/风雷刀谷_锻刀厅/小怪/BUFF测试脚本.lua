---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_锻刀厅/小怪/BUFF测试脚本.lua
-- 更新时间:	2017/2/15 17:30:31
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		--npc.CastSkill(28, 1)
		npc.DoAction(0, 10055)
		print(1)
	end
	print(2)
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com