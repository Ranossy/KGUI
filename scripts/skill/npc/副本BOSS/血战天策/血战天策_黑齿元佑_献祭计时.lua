---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_�ڳ�Ԫ��_�׼���ʱ.lua
-- ����ʱ��:	2013/9/12 14:34:10
-- �����û�:	wangpengfei1
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npcthis = GetNpc(dwCharacterID)
	if not npcthis then
		return
	end
	local scene = npcthis.GetScene()
	if not scene then
		return
	end
	local npcBoss = scene.GetNpcByNickName("BOSS_heichiyuanyou")
	if not npcBoss then
		return
	end
	local npcZK = scene.GetNpcByNickName("ZK_heichixianji")
	if npcZK then
		if scene.dwMapID == 175 then
			if npcthis.dwTemplateID == 26616 then
				local nCount1 = npcZK.GetCustomInteger4(1)
				if nCount1 then
					npcZK.SetCustomInteger4(1, nCount1 + 70)
				end
				npcBoss.AddBuff(0, 99, 6779, 1)
				npcthis.SetDisappearFrames(1 * GLOBAL.GAME_FPS, false)
			elseif npcthis.dwTemplateID == 26660 then
				local nCount2 = npcZK.GetCustomInteger4(5)
				if nCount2 then
					npcZK.SetCustomInteger4(5, nCount2 + 70)
				end
				npcBoss.AddBuff(0, 99, 6780, 1)
				npcthis.SetDisappearFrames(1 * GLOBAL.GAME_FPS, false)
			elseif npcthis.dwTemplateID == 26663 then
				local nCount3 = npcZK.GetCustomInteger4(9)
				if nCount3 then
					npcZK.SetCustomInteger4(9, nCount3 + 70)
				end
				npcBoss.AddBuff(0, 99, 6781, 1)
				npcthis.SetDisappearFrames(1 * GLOBAL.GAME_FPS, false)
			elseif npcthis.dwTemplateID == 26665 then
				local nCount4 = npcZK.GetCustomInteger4(13)
				if nCount4 then
					npcZK.SetCustomInteger4(13, nCount4 + 70)
				end
				npcBoss.AddBuff(0, 99, 6782, 1)
				npcthis.SetDisappearFrames(1 * GLOBAL.GAME_FPS, false)
			end
		else
			if npcthis.dwTemplateID == 27219 then
				local nCount1 = npcZK.GetCustomInteger4(1)
				if nCount1 then
					npcZK.SetCustomInteger4(1, nCount1 + 70)
				end
				npcBoss.AddBuff(0, 99, 6779, 2)
				npcthis.SetDisappearFrames(0.5 * GLOBAL.GAME_FPS, false)
			elseif npcthis.dwTemplateID == 27222 then
				local nCount2 = npcZK.GetCustomInteger4(5)
				if nCount2 then
					npcZK.SetCustomInteger4(5, nCount2 + 70)
				end
				npcBoss.AddBuff(0, 99, 6780, 2)
				npcthis.SetDisappearFrames(0.5 * GLOBAL.GAME_FPS, false)
			elseif npcthis.dwTemplateID == 27223 then
				local nCount3 = npcZK.GetCustomInteger4(9)
				if nCount3 then
					npcZK.SetCustomInteger4(9, nCount3 + 70)
				end
				npcBoss.AddBuff(0, 99, 6781, 2)
				npcthis.SetDisappearFrames(0.5 * GLOBAL.GAME_FPS, false)
			elseif npcthis.dwTemplateID == 27224 then
				local nCount4 = npcZK.GetCustomInteger4(13)
				if nCount4 then
					npcZK.SetCustomInteger4(13, nCount4 + 70)
				end
				npcBoss.AddBuff(0, 99, 6782, 1)
				npcthis.SetDisappearFrames(0.5 * GLOBAL.GAME_FPS, false)
				local buffthis = npcBoss.GetBuff(6782, 1)
				if buffthis then
					local nLevel = buffthis.nStackNum
					npcBoss.AddBuff(0, 99, 7172, nLevel)
				end
			end
		end
	end
	npcthis.Stand()
	npcthis.DoAction(0, 10064)
	npcBoss.PlaySfx(326, npcthis.nX, npcthis.nY, npcthis.nZ)
	npcBoss.SetCustomBoolean(62, true)
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end	
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com