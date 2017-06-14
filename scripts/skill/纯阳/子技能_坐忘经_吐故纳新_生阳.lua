------------------------------------------------
-- �ļ���    :  �Ӽ���_������_�¹�����_����.lua
-- ������    :  ����	
-- ����ʱ��  :  2009-6-29
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nBuffID = 1241, nBuffLevel = 1, nCostMana = 98}, 	--level 1         
    {nBuffID = 1241, nBuffLevel = 2, nCostMana = 128},		--level 2         
    {nBuffID = 1241, nBuffLevel = 3, nCostMana = 158},		--level 3         
    {nBuffID = 1241, nBuffLevel = 4, nCostMana = 189},		--level 4         
    {nBuffID = 1241, nBuffLevel = 5, nCostMana = 219},		--level 5         
    {nBuffID = 1241, nBuffLevel = 6, nCostMana = 249},		--level 6          
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	skill.AddAttribute(
	   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
	   		ATTRIBUTE_TYPE.CALL_BUFF_STACK_8,									-- ħ������
	   		1241,														-- ����ֵ1
	   		dwSkillLevel												-- ����ֵ2
	   		);
	skill.AddAttribute(
	   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
	   		ATTRIBUTE_TYPE.CALL_BUFF_STACK_8,									-- ħ������
	   		1241,														-- ����ֵ1
	   		dwSkillLevel												-- ����ֵ2
	   		);
	skill.AddAttribute(
	   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
	   		ATTRIBUTE_TYPE.CALL_BUFF_STACK_3,									-- ħ������
	   		1241,														-- ����ֵ1
	   		dwSkillLevel												-- ����ֵ2
	   		);
    
	skill.BindBuff(1, 1241, tSkillData[dwSkillLevel].nBuffLevel)

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 4 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����
       
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com