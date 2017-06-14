---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_���ӷ�_�ϳ�_�����¼�_�м�.lua
-- ����ʱ��:	2015/9/20 20:40:01
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_���ӷ�_�ϳ�_�����¼�_�м�.lua
-- ������    :  zhangqi
-- ����ʱ��  :  2010-03-2
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ���ӷ�
-- ��������  :
-- ����Ч��  :
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	if dwSkillLevel == 1 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/�ؽ�/�ؽ�_���ӷ�_�ϳ�_�����¼�_�м�.lua",
			0
		);
	end
	if dwSkillLevel == 2 then
		skill.BindBuff(1, 1722, 1)
	end

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--	skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;
	--skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--	skill.nTargetCountLimit	= 1;
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetSkillLevel(5965) == 1 then
		player.ClearCDTime(383)
	end
	--]]
	local nRnd = Random(1, 10000)
	if player.GetSkillLevel(6545) == 1 then
		if nRnd <= 7000 then
			player.AddBuff(player.dwID, player.nLevel, 1722, 1)
			if player.GetSkillLevel(5965) == 1 then
				local nR = Random(1, 10000)
				if nR <= 5000 and not player.GetBuff(9924, 1) then
					player.AddBuff(player.dwID, player.nLevel, 9924, 1)
					player.ClearCDTime(383)
				end
			end
		end
	else
		if nRnd <= 3000 then
			player.AddBuff(player.dwID, player.nLevel, 1722, 1)
			if player.GetSkillLevel(5965) == 1 then
				local nR = Random(1, 10000)
				if nR <= 5000 and not player.GetBuff(9924, 1) then
					player.AddBuff(player.dwID, player.nLevel, 9924, 1)
					player.ClearCDTime(383)
				end
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com