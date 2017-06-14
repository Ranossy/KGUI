---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_锻刀厅/小怪/肖南冠回血.lua
-- 更新时间:	2017/4/23 19:54:07
-- 更新用户:	ZHANGGUANYI
-- 脚本说明:
----------------------------------------------------------------------<
-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	npc.nCurrentLife = npc.nMaxLife

end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com