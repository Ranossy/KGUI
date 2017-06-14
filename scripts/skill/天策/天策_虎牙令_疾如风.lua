---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_������_�����.lua
-- ����ʱ��:	2013/5/11 21:12:10
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_������_�����.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-4
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  �����
-- ����Ч��  :  �����ٶȺ��˺�����,�����ͷ�������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 23, nBuffID = 200, nBuffLevel = 1}, -- Level 1
	{nCostMana = 28, nBuffID = 200, nBuffLevel = 2}, -- Level 2
	{nCostMana = 34, nBuffID = 200, nBuffLevel = 3}, -- Level 3
	{nCostMana = 39, nBuffID = 200, nBuffLevel = 4}, -- Level 4
	{nCostMana = 45, nBuffID = 200, nBuffLevel = 5}, -- Level 5

};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = 5;
	
    
	--skill.BindBuff(1, 2761, tSkillData[dwSkillLevel].nBuffLevel)
--ʩ�� 50����Ѫ֧���µ� ���������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC,
		705,
		1
	);
	----��߹����󷨵�����
	skill.AddAttribute(					
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		768,
		1
	);

	skill.AddAttribute(					
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --�������
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		7276,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_������_�����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 107);	   
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostManaBasePercent = 106;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
    
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--���
	player.AddBuff(player.dwID, player.nLevel, 855, 2, 1)
	if player.GetSkillLevel(5670) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 855, 3, 1)
	end

	--����Ѩ�����������û����Ѩ������߻���
	if player.GetSkillLevel(14805) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9864, 1)	--���ͱ����ļ���
	else
		player.AddBuff(player.dwID, player.nLevel, 2761, 5)	--������
	end
	
	if player.GetSkillLevel(5672) == 1 then
		player.CastSkill(6066, 1)
	end
	
	ModityCDToUI(player, 412, 0, 0)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com