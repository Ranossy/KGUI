---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/�����/�����_Ұ�޸�֪�ж�.lua
-- ����ʱ��:	2016/12/8 15:27:58
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	local leishishou3 = scene.GetNpcByNickName("leishishou3")
	local leishishou4 = scene.GetNpcByNickName("leishishou4")
	local Num = string.sub(npc.szName, 11)
	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if Num == "1" then
			if leishishou3 then
				if GetCharacterDistance(npc.dwID, leishishou3.dwID) <= 1920 then
					if not npc.GetBuff(11570, 1) then
						npc.AddBuff(npc.dwID, npc.nLevel, 11570, 1)
					end

					if not leishishou3.GetBuff(11570, 1) then
						leishishou3.AddBuff(npc.dwID, npc.nLevel, 11570, 1)
					end
				else
					npc.DelBuff(11570, 1)
					leishishou3.DelBuff(11570, 1)
				end
			end
		end

		if Num == "2" then
			if leishishou4 then
				if GetCharacterDistance(npc.dwID, leishishou4.dwID) <= 1920 then
					if not npc.GetBuff(11570, 1) then
						npc.AddBuff(npc.dwID, npc.nLevel, 11570, 1)
					end

					if not leishishou4.GetBuff(11570, 1) then
						leishishou4.AddBuff(npc.dwID, npc.nLevel, 11570, 1)
					end
				else
					npc.DelBuff(11570, 1)
					leishishou4.DelBuff(11570, 1)
				end
			end
		end
	end

	if scene.dwMapID == 270 then
		if Num == "1" then
			if leishishou3 then
				if GetCharacterDistance(npc.dwID, leishishou3.dwID) <= 1920 then
					if not npc.GetBuff(11570, 2) then
						npc.AddBuff(npc.dwID, npc.nLevel, 11570, 2, 300)
					end

					if not leishishou3.GetBuff(11570, 2) then
						leishishou3.AddBuff(npc.dwID, npc.nLevel, 11570, 2, 300)
					end
				else
					npc.DelBuff(11570, 2)
					leishishou3.DelBuff(11570, 2)
				end
			end
		end

		if Num == "2" then
			if leishishou4 then
				if GetCharacterDistance(npc.dwID, leishishou4.dwID) <= 1920 then
					if not npc.GetBuff(11570, 2) then
						npc.AddBuff(npc.dwID, npc.nLevel, 11570, 2, 300)
					end

					if not leishishou4.GetBuff(11570, 2) then
						leishishou4.AddBuff(npc.dwID, npc.nLevel, 11570, 2, 300)
					end
				else
					npc.DelBuff(11570, 2)
					leishishou4.DelBuff(11570, 2)
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com