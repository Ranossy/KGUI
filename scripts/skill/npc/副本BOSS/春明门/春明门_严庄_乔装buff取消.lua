---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/春明门/春明门_严庄_乔装buff取消.lua
-- 更新时间:	2014/5/15 16:25:08
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local playertarget = GetPlayer(nCharacterID)
	if playertarget then
		playertarget.SetDynamicSkillGroup(0)
		playertarget.PlaySfx(1013, playertarget.nX, playertarget.nY, playertarget.nZ)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com