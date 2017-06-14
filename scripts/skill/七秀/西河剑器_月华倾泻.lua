---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���ӽ���_�»���к.lua
-- ����ʱ��:	2013/5/7 14:55:44
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_���ӽ���_�»���к.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-8-31
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �ڹ�
-- �书��·  :  ��
-- ��������  :  �»���к
-- ����Ч��  :  ת������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nSelfManaDecrease = -127, nOtherManaAdd = 127, nFrame = 32},
	{nSelfManaDecrease = -205, nOtherManaAdd = 205, nFrame = 48},
	{nSelfManaDecrease = -269, nOtherManaAdd = 269, nFrame = 64},
	{nSelfManaDecrease = -333, nOtherManaAdd = 333, nFrame = 80},
	{nSelfManaDecrease = -397, nOtherManaAdd = 397, nFrame = 16},
}


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 4
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/���ӽ���_�»���к.lua", --����ֵ1
		0															--����ֵ2
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);				--����CD��1.5��
	skill.SetNormalCoolDown(1, 118);				--����CD��120��
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nOtherManaAdd * 4;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
 	
	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	skill.nChannelFrame = tSkillData[dwSkillLevel].nFrame;
	--skill.nChannelFrame		=  128
	skill.nChannelInterval = 16;
	skill.nMinChannelInterval = 1;-- ͨ�������ʱ�� 
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.nCurrentMana < player.nMaxMana * 0.15 then
		return SKILL_RESULT_CODE.NOT_ENOUGH_MANA
	else
		return nPreResult;
	end
end
function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end


function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local targetType, targetID = player.GetTarget()
	local target = GetPlayer(targetID)
	if not target then
		return
	end
	if IsEnemy(player.dwID, target.dwID) ~= true then
		if player.nCurrentMana >= player.nMaxMana * 0.15 then
			local currentMana = player.nMaxMana * 0.1
			player.nCurrentMana = player.nCurrentMana - currentMana
			target.nCurrentMana = target.nCurrentMana + currentMana
		else
			player.Stop()
		end
	end	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com