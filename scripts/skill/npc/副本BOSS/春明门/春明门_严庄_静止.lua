---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/春明门/春明门_严庄_静止.lua
-- 更新时间:	2014/5/16 14:48:53
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local scene = player.GetScene()
	local langyapanwenjunguan = scene.GetNpcByNickName("langyapanwenjunguan")
	local langyajieyinren = scene.GetNpcByNickName("langyajieyinren")
	if player.nMoveState ~= MOVE_STATE.ON_STAND then
		player.AddBuff(0, 99, 7853, 1, 30)
	end

	if player.GetBuff(7853, 1) then
		if player.GetBuff(7853, 1).nStackNum >= 5 then
			if langyapanwenjunguan then
				langyapanwenjunguan.Say(GetEditorString(6, 5350))
			end

			if langyajieyinren then
				langyajieyinren.FireAIEvent(2001, 0, 0)
			end
			
			local playerlist = scene.GetAllPlayer()
			for i = 1, #playerlist do
				local playertarget = GetPlayer(playerlist[i])
				if playertarget then
					playertarget.DelBuff(7849, 1)
					playertarget.DelGroupBuff(7853, 1)
					if langyapanwenjunguan then
						langyapanwenjunguan.ModifyThreat(playertarget.dwID, 0)
					end
				end
			end
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com