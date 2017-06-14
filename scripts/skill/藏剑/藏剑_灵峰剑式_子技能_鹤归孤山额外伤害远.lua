---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��彣ʽ_�Ӽ���_�׹��ɽԶ����.lua
-- ����ʱ��:	2013/5/29 16:45:16
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_�Ӽ���_�׹��ɽԶ����.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 76, 	nDamageRand = 9}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 86, 	nDamageRand = 10}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 96, 	nDamageRand = 11}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 106, 	nDamageRand = 12}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 116, 	nDamageRand = 13}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 126, 	nDamageRand = 14}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 136, 	nDamageRand = 15}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 146, 	nDamageRand = 16}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 156, 	nDamageRand = 17}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 166, 	nDamageRand = 18}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 176, 	nDamageRand = 19},   	-- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 186, 	nDamageRand = 20}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 196, 	nDamageRand = 21}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 206, 	nDamageRand = 22}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 216, 	nDamageRand = 23}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 226, 	nDamageRand = 24}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 236, 	nDamageRand = 25}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 246, 	nDamageRand = 26}, -- Level 18
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase*0.5/2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand*0.5/2,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
		);
	skill.AddSlowCheckDestBuff(1939, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ����Ŀ��Buff
	skill.AddCheckSelfLearntSkill(5960, 1, SKILL_COMPARE_FLAG.EQUAL);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostRage	= tSkillData[dwSkillLevel].nCostRage;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 9 then
		skill.nChannelInterval = 80*0.7*0.5;
	elseif dwSkillLevel < 18 then
		skill.nChannelInterval = (80 + (dwSkillLevel - 8) *8)*0.7*0.5
	else
		skill.nChannelInterval = 160*0.7*0.5;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 128;
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 6 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	skill.nTargetCountLimit = 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com