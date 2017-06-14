---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/�����/�����_�ױ�.lua
-- ����ʱ��:	2016/12/5 15:56:02
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
	local liuluanqileibaokongzhi = scene.GetNpcByNickName("liuluanqileibaokongzhi")
	if scene.dwMapID == 264 or scene.dwMapID == 272 then
		if liuluanqileibaokongzhi then
			playertarget.AddBuff(playertarget.dwID, playertarget.nLevel, 11562, 1, 2)
			playertarget.PlaySfx(1559, playertarget.nX, playertarget.nY, playertarget.nZ)
			playertarget.PlaySfx(8672, playertarget.nX, playertarget.nY, playertarget.nZ)
			liuluanqileibaokongzhi.SetPosition(playertarget.nX, playertarget.nY, playertarget.nZ)
			liuluanqileibaokongzhi.CastSkill(17190, 1)
			liuluanqileibaokongzhi.CastSkill(17189, 1)
			liuluanqileibaokongzhi.CastSkill(17188, 1)
		end
	end

	if scene.dwMapID == 270 then
		if liuluanqileibaokongzhi then
			playertarget.AddBuff(playertarget.dwID, playertarget.nLevel, 11562, 2, 2)
			playertarget.PlaySfx(1559, playertarget.nX, playertarget.nY, playertarget.nZ)
			playertarget.PlaySfx(8672, playertarget.nX, playertarget.nY, playertarget.nZ)
			liuluanqileibaokongzhi.SetPosition(playertarget.nX, playertarget.nY, playertarget.nZ)
			liuluanqileibaokongzhi.CastSkill(17190, 2)
			liuluanqileibaokongzhi.CastSkill(17189, 2)
			liuluanqileibaokongzhi.CastSkill(17188, 2)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com