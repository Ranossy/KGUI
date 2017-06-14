---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/�����/�����_����ĸbuff.lua
-- ����ʱ��:	2016/12/5 15:52:05
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local playertarget = GetPlayer(dwCharacterID)
	if not playertarget then
		return
	end
	local scene = playertarget.GetScene()
	local index = Random(1, 20)
	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if index == 10 then
			if playertarget and not playertarget.GetBuff(11556, 1) then
				playertarget.Stop()
				playertarget.PlaySfx(8670, playertarget.nX, playertarget.nY, 1355840)
				playertarget.PlaySfx(8682, 0, 0, 0)
				playertarget.AddBuff(playertarget.dwID, playertarget.nLevel, 11556, 1, 2)
			end
		end
	end

	if scene.dwMapID == 270 then
		if index == 10 then
			if playertarget and not playertarget.GetBuff(11556, 2) then
				playertarget.Stop()
				playertarget.PlaySfx(8670, playertarget.nX, playertarget.nY, 1355840)
				playertarget.PlaySfx(8682, 0, 0, 0)
				local liuluanqiboss = scene.GetNpcByNickName("liuluanqiboss")
				if liuluanqiboss then
					playertarget.AddBuff(liuluanqiboss.dwID, liuluanqiboss.nLevel, 11969, 2, 1)
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