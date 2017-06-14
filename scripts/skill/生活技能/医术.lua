------------------------------------------------
-- �ļ���    :  ҽ��.lua
-- ������    :  �º���	
-- ����ʱ��  :  2007-9-26
-- ��;(ģ��):  �����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  �����
-- ��������  :  ҽ��
-- ����Ч��  :  ��ҩ���ø���Ч��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{ 
	{nAttrib1 = 50 , nAttrib2 = 0 , nType = 1}, --��ƷֹѪɢ
  {nAttrib1 = 120 , nAttrib2 = 0, nType = 2}, --��Ʒ����ɢ
  {nAttrib1 = 400 ,nAttrib2 = 1 , nType = 3}, --��Ʒ����ɢ
  {nAttrib1 = 401 ,nAttrib2 = 1 , nType = 3}, --��Ʒ����ɢ
  {nAttrib1 = 55 ,nAttrib2 = 80 , nType = 4}, --��Ʒ����ɢ
  {nAttrib1 = 402 ,nAttrib2 = 1 , nType = 3}, --��Ʒǿ��ɢ
  {nAttrib1 = 403 ,nAttrib2 = 1, nType = 3}, --��Ʒ�ۻ�ɢ
  {nAttrib1 = 160 ,nAttrib2 = 0, nType = 1}, --��ƷֹѪɢ
  {nAttrib1 = 404 ,nAttrib2 = 1 , nType = 3}, --��Ʒ��ɢ
  {nAttrib1 = 270 ,nAttrib2 = 0, nType = 2}, --��Ʒ����ɢ
  {nAttrib1 = 405 ,nAttrib2 = 1 , nType = 3}, --��Ʒ����ɢ
  {nAttrib1 = 400 ,nAttrib2 = 2, nType = 3}, --��Ʒ����ɢ2
  {nAttrib1 = 406 ,nAttrib2 = 1, nType = 3}, --��Ʒ��ʹɢ
  {nAttrib1 = 407 ,nAttrib2 = 1 , nType = 3}, --������
  {nAttrib1 = 0,nAttrib2 = 0, nType = 3}, --��Ʒ��ˮ����
  {nAttrib1 = 240 ,nAttrib2 = 0, nType = 1}  --��ƷֹѪɢ
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
    local dwSkillLevel = skill.dwLevel;

if tSkillData[dwSkillLevel].nType == 1 then    
	
			skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY,
        tSkillData[dwSkillLevel].nAttrib1,
        0
    );
    skill.SetNormalCoolDown(2, 77);
    
end



if tSkillData[dwSkillLevel].nType == 2 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CURRENT_MANA,
        tSkillData[dwSkillLevel].nAttrib1,
        0
    );
     skill.SetNormalCoolDown(2, 78);
end

if tSkillData[dwSkillLevel].nType == 3 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF,
        tSkillData[dwSkillLevel].nAttrib1,
        tSkillData[dwSkillLevel].nAttrib2
    );
end


if tSkillData[dwSkillLevel].nType == 4 then
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY,
        tSkillData[dwSkillLevel].nAttrib1,
        0
    );
  skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CURRENT_MANA,
        tSkillData[dwSkillLevel].nAttrib2,
        0
    );
    skill.SetNormalCoolDown(2, 77);
    skill.SetNormalCoolDown(3, 78);
end

   ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    skill.SetNormalCoolDown(1, 76);
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= 0;
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--����ʩ����С�뾶
   -- skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 256; 										--ʩ�ŽǶ�
    
    --skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
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
end

function OnSkillLevelUp(skill, player)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com