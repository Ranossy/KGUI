---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��������_��ɫ����_�Եз��˺�.lua
-- ����ʱ��:	2013/5/1 12:31:40
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  �ź�	
-- ����ʱ��  :  2011-04-16
-- ����Ч��  :  �˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 305*0.95, 	nDamageRand = 305*0.1,  nCostMana = 42 },
	{nDamage = 330*0.95, 	nDamageRand = 330*0.1,  nCostMana = 42 },
	{nDamage = 355*0.95, 	nDamageRand = 355*0.1,  nCostMana = 42 },
	{nDamage = 380*0.95, 	nDamageRand = 380*0.1,  nCostMana = 42 },
	{nDamage = 405*0.95, 	nDamageRand = 405*0.1,  nCostMana = 42 },
	{nDamage = 430*0.95, 	nDamageRand = 430*0.1,  nCostMana = 42 },
	{nDamage = 455*0.95, 	nDamageRand = 455*0.1,  nCostMana = 42 },
	{nDamage = 480*0.95, 	nDamageRand = 480*0.1,  nCostMana = 42 },
	{nDamage = 505*0.95, 	nDamageRand = 505*0.1,  nCostMana = 42 },
	{nDamage = 530*0.95, 	nDamageRand = 530*0.1,  nCostMana = 42 },
	{nDamage = 555*0.95, 	nDamageRand = 555*0.1,  nCostMana = 42 },
	{nDamage = 580*0.95, 	nDamageRand = 580*0.1,  nCostMana = 42 },
	{nDamage = 605*0.95, 	nDamageRand = 605*0.1,  nCostMana = 42 },
	{nDamage = 630*0.95, 	nDamageRand = 630*0.1,  nCostMana = 42 },
	{nDamage = 655*0.95, 	nDamageRand = 655*0.1,  nCostMana = 42 },
	{nDamage = 680*0.95, 	nDamageRand = 680*0.1,  nCostMana = 42 },
	{nDamage = 705*0.95, 	nDamageRand = 705*0.1,  nCostMana = 42 },
	{nDamage = 730*0.95, 	nDamageRand = 730*0.1,  nCostMana = 42 },
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false
	local dwSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.LUNAR_ATTACK_POWER_PERCENT,
		-1024,
		0
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamage/10,
		0
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/10,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��������_��ɫ����_�Եз��˺�.lua",
		0
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF
		
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana = tSkillData[dwSkillLevel].nCostMana;
	
	--------------- ����������� ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										-- ����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						-- ����ʩ�����뾶
	skill.nAngleRange = 256; 									-- ʩ�ŽǶ�
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- ����֡��
	skill.nChannelInterval = 8; 			-- ͨ�������ʱ�� 
	skill.nChannelFrame = 80;			-- ͨ��������ʱ�䣬��λ֡�� 
	skill.nBulletVelocity = 0;					-- �ӵ��ٶȣ���λ ��/֡
    
	skill.nBreakRate = 1024;					--����ϵĸ���,Ĭ��1024��ʾһ�������
    
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	if not player.GetBuff(1383, 2) and not player.GetBuff(8528,1) then
		player.DelBuff(409, nLevel + 7)
		player.DelBuff(409, nLevel + 14)	
		player.DelBuff(409, nLevel)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com