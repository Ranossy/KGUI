------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_��_����.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-11-11 16:14	
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��	
-- ��������  :  ��_����
-- ����Ч��  :  װ��������4��,����������3��.ʹ����������_����,���Ӳ���ֵ���м�ֵ
--                  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


tSkillData =
{
	{nBuffID = 786, nBuffLevel = 1,nBuffID_1 = 360, nBuffLevel_1 = 1},		-- Level 1
	{nBuffID = 786, nBuffLevel = 2,nBuffID_1 = 360, nBuffLevel_1 = 2},		-- Level 2
	{nBuffID = 786, nBuffLevel = 3,nBuffID_1 = 360, nBuffLevel_1 = 3},		-- Level 3
	{nBuffID = 786, nBuffLevel = 4,nBuffID_1 = 360, nBuffLevel_1 = 4},		-- Level 4
	{nBuffID = 786, nBuffLevel = 5,nBuffID_1 = 360, nBuffLevel_1 = 5},		-- Level 5
	{nBuffID = 786, nBuffLevel = 6,nBuffID_1 = 360, nBuffLevel_1 = 6},		-- Level 6
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	
	skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF,
		360,
		tSkillData[dwSkillLevel].nBuffLevel_1
	);


    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--����CD1��
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana	=  0;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    
    
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com