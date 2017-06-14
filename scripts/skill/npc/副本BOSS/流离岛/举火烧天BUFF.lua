---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/流离岛/举火烧天BUFF.lua
-- 更新时间:	2013-4-10 16:41:57
-- 更新用户:	xiedixun1
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if npc then

		npc.CastSkill(5611, 1)
	end
end	
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com