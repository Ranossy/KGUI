------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-10-21
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,tPlayer.dwID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local scene = cPlayer.GetScene()
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("yinying")
	if not npc then
		return
	end
	local nBoss = scene.GetNpcByNickName("sumansha")
	if not nBoss then
		return
	end	
	local tPlayer = cPlayer.GetSelectCharacter()
	local nDistance = 1
	if not tPlayer then
		return
	end
	if cPlayer.nMoveState == MOVE_STATE.ON_DEATH then
		return
	end	
	local nNum = Random(10000)
	local nDistance1 = GetCharacterDistance(dwSrcID, nBoss.dwID)	
	local nDistance = GetCharacterDistance(dwCharacterID, tPlayer.dwID)
	local kungfu = cPlayer.GetKungfuMount()
	if not kungfu then
		cPlayer.Die()
	end
	local skillLevel = math.floor(cPlayer.GetTotalEquipScore() / 2000)	
	if skillLevel < 1 then
		skillLevel = 1
	end
	if skillLevel > 5 then
		skillLevel = 5
	end
	local kungfuID = kungfu.dwSkillID
	if kungfuID == 10026 or kungfuID == 10062 then
		if nDistance > 256 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.AddBuff(0,99,7249,1)
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10473)
			npc.CastSkill(8387, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10455)
			npc.CastSkill(8386, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end
	if kungfuID == 10144 or kungfuID == 10145 then
		if nDistance > 256 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10725)
			npc.CastSkill(8384, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10745)
			npc.CastSkill(8385, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end	
	if kungfuID == 10224 or kungfuID == 10225 then
		if nDistance > 1280 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,11104)
			npc.CastSkill(8389, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,11102)
			npc.CastSkill(8390, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end	
	if kungfuID == 10014 then
		if nDistance > 1280 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10610)
			npc.CastSkill(8391, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10618)
			npc.CastSkill(8392, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end
	if kungfuID == 10015 then
		if nDistance > 256 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10606)
			npc.CastSkill(8393, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10607)
			npc.CastSkill(8394, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end
	if kungfuID == 10002 or kungfuID == 10003 then
		if nDistance > 512 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10522)
			npc.CastSkill(8396, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10514)
			npc.CastSkill(8399, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end
	if kungfuID == 10242 or kungfuID == 10243 then
		if nDistance > 256 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.AddBuff(0,99,7250,1)
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,11404)
			npc.CastSkill(8400, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,11412)
			npc.CastSkill(8401, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end
	if kungfuID == 10021 then
		if nDistance > 1280 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10323)
			npc.CastSkill(8402, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10330)
			npc.CastSkill(8403, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end
	if kungfuID == 10028 then
		if nDistance1 > 1280 then
			cPlayer.RunTo(nBoss.nX, nBoss.nY)
		elseif nNum < 5001 then
			cPlayer.DoAction(0,10314)
			npc.CastSkill(8404, skillLevel, TARGET.NPC, nBoss.dwID)
		else
			cPlayer.DoAction(0,10318)
			npc.CastSkill(8405, skillLevel, TARGET.NPC, nBoss.dwID)
		end
	end
	if kungfuID == 10175 then
		if nDistance > 1280 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10817)
			npc.CastSkill(8407, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10806)
			npc.CastSkill(8408, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end
	if kungfuID == 10176 then
		if nDistance1 > 1280 then
			cPlayer.RunTo(nBoss.nX, nBoss.nY)
		elseif nNum < 5001 then
			cPlayer.DoAction(0,10817)
			npc.CastSkill(8407, skillLevel, TARGET.NPC, nBoss.dwID)
		else
			cPlayer.DoAction(0,10865)
			npc.CastSkill(8409, skillLevel, TARGET.NPC, nBoss.dwID)
		end
	end
	if kungfuID == 10081 then
		if nDistance > 1280 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10501)
			npc.CastSkill(8410, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10504)
			npc.CastSkill(8411, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end
	if kungfuID == 10080 then
		if nNum < 5001 then
			cPlayer.SetTarget(TARGET.NPC, nBoss.dwID)
			if nDistance1 > 1280 then
				cPlayer.RunTo(nBoss.nX, nBoss.nY)
			else
				cPlayer.DoAction(0,10509)
				npc.CastSkill(8412, skillLevel, TARGET.NPC, nBoss.dwID)
			end
		elseif nDistance > 1280 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		else
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,10517)
			npc.CastSkill(8413, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end
	if kungfuID == 10268 then
		if nDistance > 256 then
			cPlayer.RunTo(tPlayer.nX, tPlayer.nY)
		elseif nNum < 5001 then
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,12122)
			npc.CastSkill(8649, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		else
			cPlayer.AddBuff(0,99,7275,1)
			cPlayer.TurnToCharacter(tPlayer.dwID)
			cPlayer.DoAction(0,12123)
			npc.CastSkill(8650, skillLevel, TARGET.PLAYER, tPlayer.dwID)
		end
	end	
end

--魔法属性反应用时的执行函数,tPlayer.dwID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com