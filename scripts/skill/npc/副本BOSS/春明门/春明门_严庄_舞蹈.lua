---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/春明门/春明门_严庄_舞蹈.lua
-- 更新时间:	2014/5/16 17:07:18
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	local playerlist = scene.GetAllPlayer()
	local dierguanlangyashouwei1 = scene.GetNpcByNickName("dierguanlangyashouwei1")
	local dierguanlangyashouwei2 = scene.GetNpcByNickName("dierguanlangyashouwei2")
	local langyajieyinren = scene.GetNpcByNickName("langyajieyinren")
	if dierguanlangyashouwei1 then
		dierguanlangyashouwei1.Say(GetEditorString(6, 5349))
		if langyajieyinren then
			langyajieyinren.FireAIEvent(2001, 0, 0)
		end
		for i = 1, #playerlist do
			local playertarget = GetPlayer(playerlist[i])
			if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
				dierguanlangyashouwei1.ModifyThreat(playertarget.dwID, 0)
				if dierguanlangyashouwei2 then
					dierguanlangyashouwei2.ModifyThreat(playertarget.dwID, 0)
				end
			end
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com