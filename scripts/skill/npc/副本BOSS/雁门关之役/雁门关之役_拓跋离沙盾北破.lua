---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/雁门关之役/雁门关之役_拓跋离沙盾北破.lua
-- 更新时间:	2014/11/3 16:57:13
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	
end

function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npc = GetNpc(nCharacterID)
	if npc and npc.bFightState == true then
		npc.PlaySfx(1073, 0, 0, 0)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com